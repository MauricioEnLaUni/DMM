import express from 'express';
import userController from '../controllers/user.controller';

const userRouter = express.Router();

userRouter.route('/')
  .get(userController.info);

userRouter.route('/new')
  .post(userController.register);

userRouter.route('/auth')
  .post(userController.auth);

userRouter.route('/')
  .patch(userController.modify);

userRouter.route('/:id')
  .patch(userController.del);

export default userRouter;