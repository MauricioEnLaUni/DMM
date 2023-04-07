/**
 * @fileoverview Operations for Ticketsa
 * 
 * Main controller, allows searching for bought tickets, seats and changing
 * already bought tickets.
 */
import conn from '../config/MYSQL/Connector';

const ValidateToken = (token: string) => {
  console.log(token);
  return true;
}

const getAll = async (request: any, response: any) => {
  const { token } = request.body;

  if (!ValidateToken(token)) return response.status(400);
  const connection = await conn();
  const user = await connection.query('CALL users()');

  return response.json({ "user": user});
}

const getByOwner = (request: any, response: any) => {
  console.log(request);
  return response.status(200);
}

const sale = (request: any, response: any) => {
  console.log(request);
  return response.status(200);
}

const modify = (request: any, response: any) => {
  console.log(request);
  return response.status(204);
}

const cancel = (request: any, response: any) => {
  console.log(request);
  return response.status(204);
}

export default
{
  getAll,
  getByOwner,
  sale,
  modify,
  cancel
}