-- CreateTable
CREATE TABLE `binh_luan` (
    `binh_luan_id` INTEGER NOT NULL AUTO_INCREMENT,
    `nguoi_dung_id` INTEGER NOT NULL,
    `hinh_id` INTEGER NOT NULL,
    `ngay_binh_luan` DATE NULL,
    `noi_dung` VARCHAR(255) NULL,

    UNIQUE INDEX `binh_luan_id`(`binh_luan_id`),
    INDEX `binh_luan_ibfk_1`(`nguoi_dung_id`),
    INDEX `binh_luan_ibfk_2`(`hinh_id`),
    PRIMARY KEY (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `hinh_anh` (
    `hinh_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tieu_de` VARCHAR(255) NULL,
    `ten_hinh` VARCHAR(255) NULL,
    `duong_dan` VARCHAR(255) NULL,
    `mo_ta` VARCHAR(255) NULL,
    `nguoi_dung_id` INTEGER NULL,

    INDEX `nguoi_dung_id`(`nguoi_dung_id`),
    PRIMARY KEY (`hinh_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `luu_anh` (
    `luu_anh_id` INTEGER NOT NULL AUTO_INCREMENT,
    `hinh_id` INTEGER NULL,
    `nguoi_dung_id` INTEGER NULL,
    `ngay_luu` DATE NULL,

    UNIQUE INDEX `luu_anh_id`(`luu_anh_id`),
    INDEX `hinh_id`(`hinh_id`),
    INDEX `nguoi_dung_id`(`nguoi_dung_id`),
    PRIMARY KEY (`luu_anh_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `nguoi_dung` (
    `nguoi_dung_id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NULL,
    `mat_khau` VARCHAR(255) NULL,
    `ho_ten` VARCHAR(255) NULL,
    `tuoi` VARCHAR(255) NULL,
    `anh_dai_dien` VARCHAR(255) NULL,

    PRIMARY KEY (`nguoi_dung_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `phan_hoi` (
    `phan_hoi_id` INTEGER NOT NULL AUTO_INCREMENT,
    `nguoi_dung_id` INTEGER NOT NULL,
    `binh_luan_id` INTEGER NOT NULL,
    `ngay_binh_luan` DATE NULL,
    `noi_dung` VARCHAR(255) NULL,

    UNIQUE INDEX `phan_hoi_id`(`phan_hoi_id`),
    INDEX `phan_hoi_ibfk_1`(`nguoi_dung_id`),
    PRIMARY KEY (`binh_luan_id`, `nguoi_dung_id`, `phan_hoi_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `theo_doi` (
    `follower_id` INTEGER NOT NULL,
    `followee_id` INTEGER NOT NULL,

    INDEX `theo_doi_ibfk_2`(`followee_id`),
    PRIMARY KEY (`follower_id`, `followee_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `binh_luan` ADD CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `binh_luan` ADD CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh`(`hinh_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `hinh_anh` ADD CONSTRAINT `hinh_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `luu_anh` ADD CONSTRAINT `luu_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `luu_anh` ADD CONSTRAINT `luu_anh_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh`(`hinh_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `phan_hoi` ADD CONSTRAINT `phan_hoi_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `phan_hoi` ADD CONSTRAINT `phan_hoi_ibfk_2` FOREIGN KEY (`binh_luan_id`) REFERENCES `binh_luan`(`binh_luan_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `theo_doi` ADD CONSTRAINT `theo_doi_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `theo_doi` ADD CONSTRAINT `theo_doi_ibfk_2` FOREIGN KEY (`followee_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
