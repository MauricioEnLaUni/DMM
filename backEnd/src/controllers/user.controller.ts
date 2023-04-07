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

const modify = (request: any, response: any) => {
  const { token } = request.body;
  ValidateToken(token);
  console.log(request);
  return response.status(204);
}

const del = (request: any, response: any) => {
  console.log(request);
  return response.status(204);
}

export default
{
  info,
  register,
  auth,
  modify,
  del
}