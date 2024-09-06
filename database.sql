-- Tạo bảng nguoi_dung
CREATE TABLE nguoi_dung (
  nguoi_dung_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255),
  mat_khau VARCHAR(255),
  ho_ten VARCHAR(255),
  tuoi VARCHAR(255),
  anh_dai_dien VARCHAR(255)
);

-- Tạo bảng hinh_anh
CREATE TABLE hinh_anh (
  hinh_id INT PRIMARY KEY AUTO_INCREMENT,
  tieu_de VARCHAR(255),
  ten_hinh VARCHAR(255),
  duong_dan VARCHAR(255),
  mo_ta VARCHAR(255),
  nguoi_dung_id INT,
  FOREIGN KEY (nguoi_dung_id) REFERENCES nguoi_dung(nguoi_dung_id) ON DELETE CASCADE
);

-- Tạo bảng binh_luan
CREATE TABLE binh_luan (
  binh_luan_id INT AUTO_INCREMENT,
  nguoi_dung_id INT,
  hinh_id INT,
  ngay_binh_luan DATE,
  noi_dung VARCHAR(255),
  PRIMARY KEY (binh_luan_id, nguoi_dung_id, hinh_id),
  UNIQUE KEY (binh_luan_id),
  FOREIGN KEY (nguoi_dung_id) REFERENCES nguoi_dung(nguoi_dung_id) ON DELETE CASCADE,
  FOREIGN KEY (hinh_id) REFERENCES hinh_anh(hinh_id) ON DELETE CASCADE
);

-- Tạo bảng luu_anh
CREATE TABLE luu_anh (
  luu_anh_id INT PRIMARY KEY AUTO_INCREMENT,
  hinh_id INT,
  nguoi_dung_id INT,
  ngay_luu DATE,
  UNIQUE KEY (luu_anh_id),
  FOREIGN KEY (nguoi_dung_id) REFERENCES nguoi_dung(nguoi_dung_id) ON DELETE CASCADE,
  FOREIGN KEY (hinh_id) REFERENCES hinh_anh(hinh_id) ON DELETE CASCADE
);

-- Tạo bảng phan_hoi
CREATE TABLE phan_hoi (
  phan_hoi_id INT AUTO_INCREMENT,
  nguoi_dung_id INT,
  binh_luan_id INT,
  ngay_binh_luan DATE,
  noi_dung VARCHAR(255),
  PRIMARY KEY (binh_luan_id, nguoi_dung_id, phan_hoi_id),
  UNIQUE KEY (phan_hoi_id),
  FOREIGN KEY (nguoi_dung_id) REFERENCES nguoi_dung(nguoi_dung_id) ON DELETE CASCADE,
  FOREIGN KEY (binh_luan_id) REFERENCES binh_luan(binh_luan_id) ON DELETE CASCADE
);

-- Tạo bảng theo_doi
CREATE TABLE theo_doi (
  follower_id INT,
  followee_id INT,
  PRIMARY KEY (follower_id, followee_id),
  FOREIGN KEY (follower_id) REFERENCES nguoi_dung(nguoi_dung_id) ON DELETE CASCADE,
  FOREIGN KEY (followee_id) REFERENCES nguoi_dung(nguoi_dung_id) ON DELETE CASCADE
);