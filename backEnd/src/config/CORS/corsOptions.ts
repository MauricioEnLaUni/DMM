/**
 * @fileoverview Configuration file for CORS.
 * 
 * Searches for an associated allowedOrigins file to get a list of allowed
 * origins.
 */
import allowedOrigins from './allowedOrigins';

const corsOptions = {
  origin: (origin: any, callback: any) => {
    if (allowedOrigins.indexOf(origin) !== -1 || !origin) {
      callback(null, true);
    } else {
      callback(new Error('Not allowed by CORS'));
    }
  },
  credentials: true,
  optionsSuccessStatus: 200
}

export default corsOptions;