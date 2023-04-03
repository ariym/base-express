/*
  Warnings:

  - Added the required column `ts` to the `Marker` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Tag` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Marker" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "ts" INTEGER NOT NULL
);
INSERT INTO "new_Marker" ("createdAt", "id", "updatedAt") SELECT "createdAt", "id", "updatedAt" FROM "Marker";
DROP TABLE "Marker";
ALTER TABLE "new_Marker" RENAME TO "Marker";
CREATE TABLE "new_Tag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "name" TEXT NOT NULL
);
INSERT INTO "new_Tag" ("createdAt", "id", "updatedAt") SELECT "createdAt", "id", "updatedAt" FROM "Tag";
DROP TABLE "Tag";
ALTER TABLE "new_Tag" RENAME TO "Tag";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
