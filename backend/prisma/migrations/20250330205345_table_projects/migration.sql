-- CreateTable
CREATE TABLE "projects" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "images" TEXT[],
    "level" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "emphasis" BOOLEAN NOT NULL DEFAULT false,
    "repository" TEXT NOT NULL,

    CONSTRAINT "projects_pkey" PRIMARY KEY ("id")
);
