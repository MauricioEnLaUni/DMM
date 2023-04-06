/**
 * @fileoverview Operations for Ticketsa
 * 
 * Main controller, allows searching for bought tickets, seats and changing
 * already bought tickets.
 */
import * as argon2 from 'argon2';
import conn from '../config/MYSQL/Connector';

const getAll = (request: any, response: any) => {
  const { token } = request.body;

  return response.status(200);
}

const getByOwner = (request: any, response: any) => {
  return response.status(200);
}

const sale = (request: any, response: any) => {
  return response.status(200);
}

const modify = (request: any, response: any) => {
  return response.status(204);
}

const cancel = (request: any, response: any) => {
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