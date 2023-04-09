import express from 'express';
import ticketsController from '../controllers/tickets.controller';

const ticketsRouter = express.Router();

ticketsRouter.route('/')
  .get(ticketsController.getAll);

ticketsRouter.route('/:owner')
  .get(ticketsController.getByOwner);

ticketsRouter.route('/')
  .post(ticketsController.sale);

ticketsRouter.route('/')
  .patch(ticketsController.modify);

ticketsRouter.route('/')
  .delete(ticketsController.cancel);

export default ticketsRouter;