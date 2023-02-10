import express, { Request, Response } from 'express';
import multer from 'multer';
import path from 'path'


import whisper from 'whisper-node'


const app = express();
export default app;


//Configuration for Multer storatge
const multerStorage = multer.diskStorage({
  destination: (req, file, cb) => {
    const destination = path.join(__dirname, '../', 'temp');
    console.log("this is the destination that multer is saving to (done with path.join)", destination);
    cb(null, destination);
  },
  filename: (req, file, cb) => {
    cb(null, `${Date.now()}-${file.originalname}`);
  },
});

// Multer Filter
const multerFilter = (req, file, cb) => {
  if (file.mimetype.split("/")[1] === "wave" || file.mimetype.split("/")[1] === "wav") {
    cb(null, true);
  } else {
    cb(new Error("Not a WAV file File!!"), false);
  }
};

const upload = multer({
  storage: multerStorage,
  fileFilter: multerFilter,
});





// use multer or something idk we got to figure this out
app.post('/submit', upload.single('audio'), async (req: Request, res: Response, next: Function) => {
  try {

    // todo: the path.join is seemingly unnecessary
    // might be needed for passing to a node module (whisper-json)
    // const filePath = path.join(req.file.path);
    const filePath = req.file.path;
    
    console.log("file path", filePath);

    const transcript = await whisper(filePath);

    res.send(transcript)

  } catch (error) {
    console.log("express ground", error);
    throw error;
  }
});

