import {Request, Response, NextFunction} from 'express';
import { getTimestamp } from '../util/getTimestamp';
export default (req: Request, res: Response, next: NextFunction) => {
  const currentTime = '[' + getTimestamp().long + ']';
  console.log(currentTime, req.method, req.url);
  next();
}