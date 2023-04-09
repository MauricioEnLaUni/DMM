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
  if (!ValidateToken(token))
      return response
          .status(401)
          .json({ message: "Inicie sesión para continuar."});

  const connection = await conn();
  const rawBus: any = await connection.query('CALL `buses`()'); 
  const output: any = rawBus[0][0];

  return response.status(200).json({ buses: output });
}

const getSeats = async (request: any, response: any) => {
  const { token } = request.body;
  const trip = request.params.id;
  if (!ValidateToken(token))
      return response
          .status(401)
          .json({ message: "Inicie sesión para continuar."});

  const connection = await conn();
  const rawSeats: any = await connection.query('CALL `seatsByTrip`((?));', trip);
  const seats = rawSeats[0][0];
  return response.status(200).json({ seats: seats });
}

const newTrip = (request: any, response: any) => {
  const { token } = request.body;
  if (ValidateToken(token))
      return response
          .status(401)
          .json({ message: "Inicie sesión para continuar."});
  
  return response.status(200);
}

const replace = (request: any, response: any) => {
  const { token } = request.body;
  if (ValidateToken(token))
      return response
          .status(401)
          .json({ message: "Inicie sesión para continuar."});

  return response.status(204);
}

const modify = (request: any, response: any) => {
  const { token } = request.body;
  if (ValidateToken(token))
      return response
          .status(401)
          .json({ message: "Inicie sesión para continuar."});
  
  return response.status(204);
}

const cancel = (request: any, response: any) => {
  const { token } = request.body;
  if (ValidateToken(token))
      return response
          .status(401)
          .json({ message: "Inicie sesión para continuar."});

  
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