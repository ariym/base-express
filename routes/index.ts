import express, { Request, Response } from 'express';
import { PrismaClient } from '@prisma/client';

const server = express();
const prisma = new PrismaClient();

// route to test that prisma saves
server.post('/prisma-create', async (req: Request, res: Response) => {
  const { ts } = req.body;

  // 1. read json from request body
  // 2. save json to prisma
  // 3. query prisma for saved json
  // 4. send prisma query response back to client

  // Pass 'user' object into query
  const newClip = await prisma.marker.create({ data: { ts } });

  res.json(newClip);

});


export default server;