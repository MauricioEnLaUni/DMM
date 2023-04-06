/**
 * @fileoverview Operations for Users
 * 
 * Include authentication operations for user accounts as well as patching
 * operations.
 * PUT operations are not included as they make no sense for Account management
 */
import * as argon2 from 'argon2';
import conn from '../config/MYSQL/Connector';

const info = (request: any, response: any) => {
  const { token } = request.body;

  return response.status(200);
}

const register = (request: any, response: any) => {
  return response.status(200);
}

const auth = (request: any, response: any) => {
  return response.status(200);
}

const modify = (request: any, response: any) => {
  return response.status(204);
}

const del = (request: any, response: any) => {
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