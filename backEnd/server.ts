/**
 * @fileoverview Bus Ticket Sale System
 * 
 * Allows for searching for trips, selling tickets, modifying a ticket or
 * cancelling a sale.
 */
// imports
import * as dotenv from 'dotenv';
dotenv.config();
import express from 'express';
import cors from 'cors';
import cookieParser from 'cookie-parser';

// Custom import
import corsOptions from './src/config/CORS/corsOptions';

// Routes
import userRouter from './src/Routes/user.route';
import tripsRouter from './src/Routes/trips.route';
import ticketsRouter from './src/Routes/tickets.route';

// Declaración de variables
const server = express();
const PORT = process.env.PORT || 8009;

// Middleware Setup
server.use(cors(corsOptions));
server.use(express.json());
server.use(cookieParser());

// Router
// Unverified Routes
server.use('/user', userRouter);
server.use('/trip', tripsRouter);
server.use('/tickets', ticketsRouter);

server.listen(PORT, () => console.log(`Server running on port ${PORT}.`));