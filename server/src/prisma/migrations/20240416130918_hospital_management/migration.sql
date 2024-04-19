-- CreateTable
CREATE TABLE "ame" (
    "id" TEXT NOT NULL,

    CONSTRAINT "ame_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pme" (
    "id" TEXT NOT NULL,

    CONSTRAINT "pme_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ame" ADD CONSTRAINT "ame_id_fkey" FOREIGN KEY ("id") REFERENCES "MedicalRecord"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pme" ADD CONSTRAINT "pme_id_fkey" FOREIGN KEY ("id") REFERENCES "MedicalRecord"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
