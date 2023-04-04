import express, { Request, Response } from 'express';
import { PrismaClient } from '@prisma/client';

const server = express();
const prisma = new PrismaClient();

// route to test that prisma saves
server.post('/prisma-create', async (req: Request, res: Response) => {
  const { petName } = req.body;

  const newRow = await prisma.pet.create({ data: {name: petName} });

  res.json(newRow);

});

export default server;