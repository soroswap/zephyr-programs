import { Request, Response, NextFunction } from 'express';

export const errorHandler = (err: any, req: Request, res: Response, next: NextFunction) => {
    console.error(`Error: ${err.message}`);
    console.error(err.stack);
  
    const statusCode = err.statusCode || 500;
    res.status(statusCode).json({
      error: err.name || "Error",
      message: err.message || "An unexpected error occurred",
    });
};
