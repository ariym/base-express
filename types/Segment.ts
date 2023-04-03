interface Segment {
  id: string;
  source: string; // URL or file path
  start: number; // in ms
  end: number; // in ms
  tags: string[];
}