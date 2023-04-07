/**
 * @fileoverview Operations for Ticketsa
 * 
 * Main controller, allows searching for bought tickets, seats and changing
 * already bought tickets.
 */
import conn from '../config/MYSQL/Connector';

const getAll = async (request: any, response: any) => {
  const { token } = request.body;
  console.log(token);

  const connection = await conn();
  console.log(connection);

  return response.status(200);
}

const getSeats = (request: any, response: any) => {
  console.log(request);
  return response.status(200);
}

const newTrip = (request: any, response: any) => {
  console.log(request);
  return response.status(200);
}

const replace = (request: any, response: any) => {
  console.log(request);
  return response.status(204);
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
  getSeats,
  newTrip,
  replace,
  modify,
  cancel
}