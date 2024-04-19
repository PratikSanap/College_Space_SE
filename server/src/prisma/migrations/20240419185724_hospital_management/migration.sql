/*
  Warnings:

  - The primary key for the `ame` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `ame` table. All the data in the column will be lost.
  - The primary key for the `pme` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `pme` table. All the data in the column will be lost.
  - Added the required column `ameid` to the `Test` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pmeid` to the `Test` table without a default value. This is not possible if the table is not empty.
  - The required column `ameid` was added to the `ame` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `medicalrecordid` to the `ame` table without a default value. This is not possible if the table is not empty.
  - Added the required column `medicalrecordid` to the `pme` table without a default value. This is not possible if the table is not empty.
  - The required column `pmeid` was added to the `pme` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE "ame" DROP CONSTRAINT "ame_id_fkey";

-- DropForeignKey
ALTER TABLE "pme" DROP CONSTRAINT "pme_id_fkey";

-- AlterTable
ALTER TABLE "Test" ADD COLUMN     "ameid" TEXT NOT NULL,
ADD COLUMN     "pmeid" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "ame" DROP CONSTRAINT "ame_pkey",
DROP COLUMN "id",
ADD COLUMN     "ameid" TEXT NOT NULL,
ADD COLUMN     "medicalrecordid" TEXT NOT NULL,
ADD CONSTRAINT "ame_pkey" PRIMARY KEY ("ameid");

-- AlterTable
ALTER TABLE "pme" DROP CONSTRAINT "pme_pkey",
DROP COLUMN "id",
ADD COLUMN     "medicalrecordid" TEXT NOT NULL,
ADD COLUMN     "pmeid" TEXT NOT NULL,
ADD CONSTRAINT "pme_pkey" PRIMARY KEY ("pmeid");

-- AddForeignKey
ALTER TABLE "Test" ADD CONSTRAINT "Test_ameid_fkey" FOREIGN KEY ("ameid") REFERENCES "ame"("ameid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Test" ADD CONSTRAINT "Test_pmeid_fkey" FOREIGN KEY ("pmeid") REFERENCES "pme"("pmeid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ame" ADD CONSTRAINT "ame_medicalrecordid_fkey" FOREIGN KEY ("medicalrecordid") REFERENCES "MedicalRecord"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pme" ADD CONSTRAINT "pme_medicalrecordid_fkey" FOREIGN KEY ("medicalrecordid") REFERENCES "MedicalRecord"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
