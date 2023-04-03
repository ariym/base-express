/*
  Warnings:

  - You are about to drop the `TimelineEntry` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `grid` to the `Space` table without a default value. This is not possible if the table is not empty.
  - Added the required column `query` to the `Space` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "TimelineEntry";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Segment" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tsBegin" INTEGER NOT NULL,
    "tsEnd" INTEGER NOT NULL,
    "clipId" TEXT NOT NULL,
    "preferences" TEXT NOT NULL,
    CONSTRAINT "Segment_clipId_fkey" FOREIGN KEY ("clipId") REFERENCES "Clip" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Space" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "grid" TEXT NOT NULL,
    "query" TEXT NOT NULL
);
INSERT INTO "new_Space" ("createdAt", "description", "id", "name", "updatedAt") SELECT "createdAt", "description", "id", "name", "updatedAt" FROM "Space";
DROP TABLE "Space";
ALTER TABLE "new_Space" RENAME TO "Space";
CREATE TABLE "new_Tag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "name" TEXT NOT NULL,
    "segmentId" TEXT,
    "spaceId" TEXT,
    CONSTRAINT "Tag_segmentId_fkey" FOREIGN KEY ("segmentId") REFERENCES "Segment" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Tag_spaceId_fkey" FOREIGN KEY ("spaceId") REFERENCES "Space" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Tag" ("createdAt", "id", "name", "updatedAt") SELECT "createdAt", "id", "name", "updatedAt" FROM "Tag";
DROP TABLE "Tag";
ALTER TABLE "new_Tag" RENAME TO "Tag";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
