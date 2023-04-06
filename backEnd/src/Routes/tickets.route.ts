import express from 'express';
import ticketsController from '../controllers/tickets.controller';

const router = express.Router();

router.route('/tickets/all')
  .get(ticketsController.getAll);

router.route('/tickets/:owner')
  .get(ticketsController.getByOwner);

router.route('/tickets/buy')
  .post(ticketsController.sale);

router.route('/tickets')
  .patch(ticketsController.modify);

router.route('/tickets')
  .delete(ticketsController.cancel);

module.exports = router;