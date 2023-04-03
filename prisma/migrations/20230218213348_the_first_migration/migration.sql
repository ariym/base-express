-- CreateTable
CREATE TABLE "TimelineEntry" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tsBegin" INTEGER NOT NULL,
    "tsEnd" INTEGER NOT NULL,
    "clipId" TEXT NOT NULL,
    CONSTRAINT "TimelineEntry_clipId_fkey" FOREIGN KEY ("clipId") REFERENCES "Clip" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Clip" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "fileId" TEXT NOT NULL,
    CONSTRAINT "Clip_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES "File" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "File" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "name" TEXT NOT NULL,
    "size" INTEGER NOT NULL,
    "runTime" DECIMAL NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Space" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Tag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Metadata" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Marker" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "_ClipToSpace" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_ClipToSpace_A_fkey" FOREIGN KEY ("A") REFERENCES "Clip" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_ClipToSpace_B_fkey" FOREIGN KEY ("B") REFERENCES "Space" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Clip_fileId_key" ON "Clip"("fileId");

-- CreateIndex
CREATE UNIQUE INDEX "_ClipToSpace_AB_unique" ON "_ClipToSpace"("A", "B");

-- CreateIndex
CREATE INDEX "_ClipToSpace_B_index" ON "_ClipToSpace"("B");
