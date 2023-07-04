import { Request, Response, NextFunction } from 'express';
export default (err: Error, req: Request, res: Response, next: NextFunction) => {
  // Generic catch-all for errors.
  if (err) {
    console.log("generic error caught", err);

    // if status less than 400 use generic 500 code
    let status = res.statusCode
    if (status < 400) {
      status = 500;
    }

    res.status(status)
    res.json({ status, message: err.message })
  }
}