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
import path from 'path';
import cookieParser from 'cookie-parser';

// Custom import
import corsOptions from './config/CORS/corsOptions';

// Declaración de variables
const server = express();
const PORT = process.env.PORT || 8009;

// Middleware Setup
server.use(cors(corsOptions));
server.use(express.json());
server.use(cookieParser());

// Static file serve
const publicDir = path.join(__dirname, 'public');
server.use('/static', express.static(publicDir));

// Router
// Unverified Routes
server.use('/', require('./src/routes/root'));
server.use('/user', require('./src/routes/userRoutes'));
server.use('/logout', require('./src/routes/logout'));
server.use('/resources', require('./src/routes/hallRoute'));

// CRUD
server.use('/ticket', require('./src/routes/ticketRoute'));

// Verified Routes
server.use('/admin', require('./src/routes/adminRoutes'));
server.use('/auth', require('./src/routes/refresh'));
server.use('/refresh', require('./src/routes/refresh'));

server.listen(PORT, () => console.log(`Server running on port ${PORT}.`));