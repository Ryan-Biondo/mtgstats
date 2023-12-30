/*
  Warnings:

  - You are about to alter the column `manaCost` on the `commander` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to drop the `_gametocommander` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `players` to the `Game` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `_gametocommander` DROP FOREIGN KEY `_GameToCommander_A_fkey`;

-- DropForeignKey
ALTER TABLE `_gametocommander` DROP FOREIGN KEY `_GameToCommander_B_fkey`;

-- AlterTable
ALTER TABLE `commander` MODIFY `manaCost` INTEGER NULL;

-- AlterTable
ALTER TABLE `game` ADD COLUMN `players` JSON NOT NULL,
    ADD COLUMN `winner` VARCHAR(191) NULL;

-- DropTable
DROP TABLE `_gametocommander`;

-- CreateTable
CREATE TABLE `_GameCommander` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_GameCommander_AB_unique`(`A`, `B`),
    INDEX `_GameCommander_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_GameCommander` ADD CONSTRAINT `_GameCommander_A_fkey` FOREIGN KEY (`A`) REFERENCES `Commander`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_GameCommander` ADD CONSTRAINT `_GameCommander_B_fkey` FOREIGN KEY (`B`) REFERENCES `Game`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
