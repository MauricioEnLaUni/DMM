/**
 * @fileoverview Operations for Ticketsa
 * 
 * Main controller, allows searching for bought tickets, seats and changing
 * already bought tickets.
 */
import conn from '../config/MYSQL/Connector';
import SaleItem from '../models/sale.model';

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

const sale = async (request: any, response: any) => {
  const { id_bus, id_usr, seats, price }: {id_bus: number, id_usr: number, seats: Array<number>, price: number } = request.body;
  const data: Array<SaleItem> = [];
  

  seats.forEach(e => {
    const t: SaleItem = new SaleItem(id_bus, id_usr, e, price);
    data.push(t);
  });
  
  const connection = await conn();
  const data_json = JSON.stringify(data);
  console.log(data_json);
  await connection.query('CALL `sale`((?))', data_json);
  return response.status(201);
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