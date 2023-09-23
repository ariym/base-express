import express, { Express } from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';

import routes from './routes';
import { getTimestamp } from './util/getTimestamp';
import { logger, errorHandler } from './middleware';

// app.use(notFoundError); // throw error for routes not found in routes.ts

// environment variables
require('dotenv').config({path: __dirname + '/.env'});
const {IP, PORT} = process.env;


// for use in subfolders
global.__basedir = __dirname;


const app: Express = express();


// pre route middleware
app.use(cors());
app.use(bodyParser.json());
app.use(logger);


// routes
app.use(routes);


// post route middleware
app.use(errorHandler);

// catch unhandled promise rejections
process.on('unhandledRejection', (err: any, promise) => {
  console.log(`Error: ${err.message}`);
  // close server & exit process
  app.close(() => process.exit(1));
});



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