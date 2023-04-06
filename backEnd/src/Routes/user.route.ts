import express from 'express';
import userController from '../controllers/user.controller';

const router = express.Router();

router.route('/user/:id')
  .get(userController.info);

router.route('/user/new')
  .post(userController.register);

router.route('/user/auth')
  .post(userController.auth);

router.route('/user')
  .patch(userController.modify);

router.route('/user/:id')
  .patch(userController.del);

module.exports = router;