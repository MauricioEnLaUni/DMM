import express from 'express';
import tripsController from '../controllers/trips.controller';

const tripsRouter = express.Router();

tripsRouter.route('/')
  .get(tripsController.getAll);

tripsRouter.route('/:id')
  .get(tripsController.getSeats);

tripsRouter.route('/')
  .post(tripsController.newTrip);

tripsRouter.route('/')
  .put(tripsController.replace);

tripsRouter.route('/')
  .patch(tripsController.modify);

tripsRouter.route('/')
  .delete(tripsController.cancel);

export default tripsRouter;