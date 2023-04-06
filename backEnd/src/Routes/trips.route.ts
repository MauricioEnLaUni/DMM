import express from 'express';
import tripsController from '../controllers/trips.controller';

const router = express.Router();

router.route('/trips')
  .get(tripsController.getAll);

router.route('/trips/:id')
  .get(tripsController.getSeats);

router.route('/trips')
  .post(tripsController.newTrip);

router.route('/trips')
  .put(tripsController.replace);

router.route('/trips')
  .patch(tripsController.modify);

router.route('/trips')
  .delete(tripsController.cancel);

module.exports = router;