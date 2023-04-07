/**
 * @fileoverview Operations for Users
 * 
 * Include authentication operations for user accounts as well as patching
 * operations.
 * PUT operations are not included as they make no sense for Account management
 */
import conn from '../config/MYSQL/Connector';
import * as argon2 from 'argon2';

const ValidateToken = (token: string) => {
  console.log(token);
  return true;
}

const validatePassword = (pwd: string, hash: string) => {
  console.log(pwd);
  console.log(hash);
  return true;
}

const info = async (request: any, response: any) => {
  const { token } = request.body;
  ValidateToken(token);

  return response.json({});
}

const uniqueUsername = async (usr: string, conn: any) => {
  const rawUsers = await conn.query('CALL getUsers()');
  const userNames: Array<string> = rawUsers[0][0]
      .map((u: { name: any; }) => u.name);
  if (userNames.includes(usr)) return false;

  return true;
}

const updateLastName = async (id: number, name: string, conn: any) => {
  await conn.query('UPDATE `users` SET `last_name` = (?) WHERE id = (?)',
      [name, id]);
}

const updatePassword = async (id: number, password: string, conn: any) => {
  const newPwd = argon2.hash(password);
  await conn.query('UPDATE `users` SET `password` = (?) WHERE id = (?)',
      [newPwd, id]);
}

const updatePhone = async (id: number, phone: string, conn: any) => {
  await conn.query('UPDATE `users` SET `telefono` = (?) WHERE id = (?)',
      [phone, id]);
}

const update = [updateLastName, updatePassword, updatePhone];

const register = async (request: any, response: any) => {
  const { username, password } = request.body;

  const connection = await conn();
  if (!await uniqueUsername(username, connection))
  {
    return response.status(409).json({ message: "El nombre de usuario ya está en uso"});
  }
  const hashedPwd = await argon2.hash(password);
  
  await connection.query('CALL insert_user((?), (?), (?))',
    [username, null, hashedPwd]);

  return response
    .status(201)
    .json({ message: `Usuario con nombre ${username} creado`});
}

const auth = async (request: any, response: any) => {
  const { username, password } = request.body;
  const connection = await conn();
  const user: any = await connection.query('CALL getUsersByName((?))', username);
  const output: any = user[0][0]
  if (output === null) return 404;
  if (!validatePassword(password, output.password)) return response.status(400);

  return response.json({ "userInfo": output});
}

class UserUpdateDto {
  id: number;
  field: Array<number>;
  changes: Array<any>;
  token: string;

  constructor(id: number, field: Array<number>, changes: Array<any>, token: string)
  {
    this.id = id;
    this.field = field;
    this.changes = changes;
    this.token = token;
  }
}

const modify = async (request: any, response: any) => {
  const { req }: { req: UserUpdateDto } = request.body;
  if (!ValidateToken(req.token))
      return response
          .status(401)
          .json({ message: "Inicie sesión para realizar cambios."});

  const connection = await conn();

  req.changes.forEach((e, i) => {
    update[req.field[i]](req.id, e, connection);
  })
  return response.status(204);
}

const del = async (request: any, response: any) => {
  const { token, id } = request.body;
  if (!ValidateToken(token))
      return response
          .status(401)
          .json({ message: "Inicie sesión para realizar cambios."});

  const connection = await conn();
  await connection.query('DELETE FROM `users` WHERE `id` = (?)', id);
  return response.status(204).json({ message: `Usuario con id de ${id} ha sido eliminado.`});
}

export default
{
  info,
  register,
  auth,
  modify,
  del
}