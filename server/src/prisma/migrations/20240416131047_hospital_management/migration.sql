/*
  Warnings:

  - Added the required column `description` to the `ame` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `pme` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ame" ADD COLUMN     "description" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "pme" ADD COLUMN     "description" TEXT NOT NULL;
