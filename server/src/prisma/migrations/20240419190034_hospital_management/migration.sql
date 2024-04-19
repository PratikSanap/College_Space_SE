/*
  Warnings:

  - You are about to drop the column `medicalrecordid` on the `pme` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "ame" DROP CONSTRAINT "ame_medicalrecordid_fkey";

-- DropForeignKey
ALTER TABLE "pme" DROP CONSTRAINT "pme_medicalrecordid_fkey";

-- AlterTable
ALTER TABLE "pme" DROP COLUMN "medicalrecordid";

-- AddForeignKey
ALTER TABLE "ame" ADD CONSTRAINT "ame_ameid_fkey" FOREIGN KEY ("ameid") REFERENCES "MedicalRecord"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pme" ADD CONSTRAINT "pme_pmeid_fkey" FOREIGN KEY ("pmeid") REFERENCES "MedicalRecord"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
