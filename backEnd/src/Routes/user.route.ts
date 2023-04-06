import express from 'express';
import userController from '../controllers/user.controller';

const router = express.Router();

router.route('/user')
  .get(userController.info);

router.route('/new')
  .post(userController.register);

router.route('/auth')
  .post(userController.auth);

router.route('/email')
  .patch(userController.modify);

router.route('/user')
  .patch(userController.del);

module.exports = router;