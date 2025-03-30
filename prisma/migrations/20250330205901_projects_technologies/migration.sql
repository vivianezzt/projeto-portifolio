-- CreateTable
CREATE TABLE "_ProjectsToTechnologies" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_ProjectsToTechnologies_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_ProjectsToTechnologies_B_index" ON "_ProjectsToTechnologies"("B");

-- AddForeignKey
ALTER TABLE "_ProjectsToTechnologies" ADD CONSTRAINT "_ProjectsToTechnologies_A_fkey" FOREIGN KEY ("A") REFERENCES "projects"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectsToTechnologies" ADD CONSTRAINT "_ProjectsToTechnologies_B_fkey" FOREIGN KEY ("B") REFERENCES "technologies"("id") ON DELETE CASCADE ON UPDATE CASCADE;
