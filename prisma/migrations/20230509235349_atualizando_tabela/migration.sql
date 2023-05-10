/*
  Warnings:

  - You are about to drop the column `datahorario` on the `consultas` table. All the data in the column will be lost.
  - Added the required column `data` to the `consultas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hora` to the `consultas` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_consultas" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "numerocarteira" TEXT NOT NULL,
    "especialidademedica" TEXT NOT NULL,
    "data" TEXT NOT NULL,
    "hora" TEXT NOT NULL
);
INSERT INTO "new_consultas" ("cpf", "especialidademedica", "id", "nome", "numerocarteira") SELECT "cpf", "especialidademedica", "id", "nome", "numerocarteira" FROM "consultas";
DROP TABLE "consultas";
ALTER TABLE "new_consultas" RENAME TO "consultas";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
