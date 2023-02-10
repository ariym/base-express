import express, { Express } from 'express';
import cors from 'cors';

import routes from './routes';
import { getTimestamp } from './util';
import { logger, notFoundError, errorHandler } from './middleware';

// environment variables
require('dotenv').config({path: __dirname + '/.env'});
const {IP, PORT} = process.env;

// for use in subfolders
global.__basedir = __dirname;



const app: Express = express();
app.use(cors());



// logging middleware
app.use(logger);



// routes
app.use(routes);



// throw error for routes not found in routes.ts
app.use(notFoundError);


// error handler
app.use(errorHandler);



// run the server
app.listen(
  Number(PORT),
  IP,
  () => console.table({
    'Start Time': getTimestamp().long,
    "Environment": process.env.NODE_ENV,
    "IP": IP,
    "Port": PORT,
  })
);