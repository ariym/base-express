import {Request, Response, Next} from 'express'

// Middleware to avoid having to write trycatch in every async controller
// from this SO answer: https://stackoverflow.com/a/63776090

const asyncHandler = fn => (req: Request, res: Response, next: Next) => {
  return Promise
      .resolve(fn(req, res, next))
      .catch(next);
};

export default asyncHandler;
