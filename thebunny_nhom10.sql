-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 28, 2026 lúc 05:04 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `thebunny_nhom10`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bai_dang`
--

CREATE TABLE `bai_dang` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `noi_dung` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ban_cung_tien`
--

CREATE TABLE `ban_cung_tien` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `friend_user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('Pending','Accepted','Blocked') NOT NULL DEFAULT 'Pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bao_cao_thong_ke`
--

CREATE TABLE `bao_cao_thong_ke` (
  `id` int(10) UNSIGNED NOT NULL,
  `quan_tri_user_id` int(10) UNSIGNED NOT NULL,
  `loai_bao_cao` varchar(64) NOT NULL,
  `noi_dung_bao_cao` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bao_cao_vi_pham`
--

CREATE TABLE `bao_cao_vi_pham` (
  `id` int(10) UNSIGNED NOT NULL,
  `nguoi_bao_cao_id` int(10) UNSIGNED NOT NULL,
  `bai_dang_id` int(10) UNSIGNED DEFAULT NULL,
  `nguoi_bi_bao_cao_id` int(10) UNSIGNED DEFAULT NULL,
  `ly_do` text NOT NULL,
  `trang_thai` enum('Pending','Reviewed','Rejected','Resolved') NOT NULL DEFAULT 'Pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luan`
--

CREATE TABLE `binh_luan` (
  `id` int(10) UNSIGNED NOT NULL,
  `bai_dang_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `noi_dung` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bo_de`
--

CREATE TABLE `bo_de` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten_bo_de` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cau_hoi`
--

CREATE TABLE `cau_hoi` (
  `id` int(10) UNSIGNED NOT NULL,
  `bo_de_id` int(10) UNSIGNED NOT NULL,
  `noi_dung` text NOT NULL,
  `lua_chon_a` varchar(500) NOT NULL,
  `lua_chon_b` varchar(500) NOT NULL,
  `lua_chon_c` varchar(500) NOT NULL,
  `lua_chon_d` varchar(500) NOT NULL,
  `dap_an_dung` enum('A','B','C','D') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cuoc_tro_chuyen`
--

CREATE TABLE `cuoc_tro_chuyen` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cuoc_tro_chuyen_thanh_vien`
--

CREATE TABLE `cuoc_tro_chuyen_thanh_vien` (
  `cuoc_tro_chuyen_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hang_tho`
--

CREATE TABLE `hang_tho` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten_hang_tho` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hashtag`
--

CREATE TABLE `hashtag` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten_hashtag` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ho_so_ca_nhan`
--

CREATE TABLE `ho_so_ca_nhan` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `thong_tin_dinh_danh` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luot_chia_se`
--

CREATE TABLE `luot_chia_se` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `bai_dang_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luot_thich`
--

CREATE TABLE `luot_thich` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `bai_dang_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phien_luyen_tap`
--

CREATE TABLE `phien_luyen_tap` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `diem_so` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong_thach_dau`
--

CREATE TABLE `phong_thach_dau` (
  `id` int(10) UNSIGNED NOT NULL,
  `bo_de_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `su_kien`
--

CREATE TABLE `su_kien` (
  `id` int(10) UNSIGNED NOT NULL,
  `tieu_de` varchar(500) NOT NULL,
  `thoi_gian` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_lieu`
--

CREATE TABLE `tai_lieu` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ten_tai_lieu` varchar(500) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanh_vien_su_kien`
--

CREATE TABLE `thanh_vien_su_kien` (
  `id` int(10) UNSIGNED NOT NULL,
  `su_kien_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `trang_thai_duyet` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_bao`
--

CREATE TABLE `thong_bao` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `noi_dung` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tin_nhan`
--

CREATE TABLE `tin_nhan` (
  `id` int(10) UNSIGNED NOT NULL,
  `cuoc_tro_chuyen_id` int(10) UNSIGNED NOT NULL,
  `sender_user_id` int(10) UNSIGNED NOT NULL,
  `noi_dung` text NOT NULL,
  `thoi_gian` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tran_dau`
--

CREATE TABLE `tran_dau` (
  `id` int(10) UNSIGNED NOT NULL,
  `phong_thach_dau_id` int(10) UNSIGNED NOT NULL,
  `nguoi_choi_1_id` int(10) UNSIGNED NOT NULL,
  `nguoi_choi_2_id` int(10) UNSIGNED NOT NULL,
  `diem_nguoi_1` int(11) DEFAULT NULL,
  `diem_nguoi_2` int(11) DEFAULT NULL,
  `trang_thai` enum('cho','dang_dau','ket_thuc') NOT NULL DEFAULT 'cho',
  `started_at` datetime DEFAULT NULL,
  `ended_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `status` enum('Active','Banned','Pending') NOT NULL DEFAULT 'Pending',
  `is_online` tinyint(1) NOT NULL DEFAULT 0,
  `user_type` enum('hoc_sinh','sinh_vien','giao_vien','quan_tri_vien') NOT NULL,
  `truong_hoc` varchar(255) DEFAULT NULL,
  `truong_dai_hoc` varchar(255) DEFAULT NULL,
  `giay_to_chung_minh` varchar(255) DEFAULT NULL,
  `role_level` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_hang_tho`
--

CREATE TABLE `user_hang_tho` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `hang_tho_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_phong_thach_dau`
--

CREATE TABLE `user_phong_thach_dau` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `phong_thach_dau_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bai_dang`
--
ALTER TABLE `bai_dang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `ban_cung_tien`
--
ALTER TABLE `ban_cung_tien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cap` (`user_id`,`friend_user_id`),
  ADD KEY `friend_user_id` (`friend_user_id`);

--
-- Chỉ mục cho bảng `bao_cao_thong_ke`
--
ALTER TABLE `bao_cao_thong_ke`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quan_tri_user_id` (`quan_tri_user_id`);

--
-- Chỉ mục cho bảng `bao_cao_vi_pham`
--
ALTER TABLE `bao_cao_vi_pham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nguoi_bao_cao_id` (`nguoi_bao_cao_id`),
  ADD KEY `bai_dang_id` (`bai_dang_id`),
  ADD KEY `nguoi_bi_bao_cao_id` (`nguoi_bi_bao_cao_id`);

--
-- Chỉ mục cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bai_dang_id` (`bai_dang_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `bo_de`
--
ALTER TABLE `bo_de`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cau_hoi`
--
ALTER TABLE `cau_hoi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bo_de_id` (`bo_de_id`);

--
-- Chỉ mục cho bảng `cuoc_tro_chuyen`
--
ALTER TABLE `cuoc_tro_chuyen`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cuoc_tro_chuyen_thanh_vien`
--
ALTER TABLE `cuoc_tro_chuyen_thanh_vien`
  ADD PRIMARY KEY (`cuoc_tro_chuyen_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `hang_tho`
--
ALTER TABLE `hang_tho`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hashtag`
--
ALTER TABLE `hashtag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_ten_hashtag` (`ten_hashtag`);

--
-- Chỉ mục cho bảng `ho_so_ca_nhan`
--
ALTER TABLE `ho_so_ca_nhan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_user` (`user_id`);

--
-- Chỉ mục cho bảng `luot_chia_se`
--
ALTER TABLE `luot_chia_se`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `bai_dang_id` (`bai_dang_id`);

--
-- Chỉ mục cho bảng `luot_thich`
--
ALTER TABLE `luot_thich`
  ADD PRIMARY KEY (`user_id`,`bai_dang_id`),
  ADD KEY `bai_dang_id` (`bai_dang_id`);

--
-- Chỉ mục cho bảng `phien_luyen_tap`
--
ALTER TABLE `phien_luyen_tap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `phong_thach_dau`
--
ALTER TABLE `phong_thach_dau`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bo_de_id` (`bo_de_id`);

--
-- Chỉ mục cho bảng `su_kien`
--
ALTER TABLE `su_kien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tai_lieu`
--
ALTER TABLE `tai_lieu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `thanh_vien_su_kien`
--
ALTER TABLE `thanh_vien_su_kien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_su_kien_user` (`su_kien_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `tin_nhan`
--
ALTER TABLE `tin_nhan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuoc_tro_chuyen_id` (`cuoc_tro_chuyen_id`),
  ADD KEY `sender_user_id` (`sender_user_id`);

--
-- Chỉ mục cho bảng `tran_dau`
--
ALTER TABLE `tran_dau`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phong_thach_dau_id` (`phong_thach_dau_id`),
  ADD KEY `nguoi_choi_1_id` (`nguoi_choi_1_id`),
  ADD KEY `nguoi_choi_2_id` (`nguoi_choi_2_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_username` (`username`),
  ADD UNIQUE KEY `uk_email` (`email`);

--
-- Chỉ mục cho bảng `user_hang_tho`
--
ALTER TABLE `user_hang_tho`
  ADD PRIMARY KEY (`user_id`,`hang_tho_id`),
  ADD KEY `hang_tho_id` (`hang_tho_id`);

--
-- Chỉ mục cho bảng `user_phong_thach_dau`
--
ALTER TABLE `user_phong_thach_dau`
  ADD PRIMARY KEY (`user_id`,`phong_thach_dau_id`),
  ADD KEY `phong_thach_dau_id` (`phong_thach_dau_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bai_dang`
--
ALTER TABLE `bai_dang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ban_cung_tien`
--
ALTER TABLE `ban_cung_tien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bao_cao_thong_ke`
--
ALTER TABLE `bao_cao_thong_ke`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bao_cao_vi_pham`
--
ALTER TABLE `bao_cao_vi_pham`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bo_de`
--
ALTER TABLE `bo_de`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cau_hoi`
--
ALTER TABLE `cau_hoi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cuoc_tro_chuyen`
--
ALTER TABLE `cuoc_tro_chuyen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hang_tho`
--
ALTER TABLE `hang_tho`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hashtag`
--
ALTER TABLE `hashtag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ho_so_ca_nhan`
--
ALTER TABLE `ho_so_ca_nhan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `luot_chia_se`
--
ALTER TABLE `luot_chia_se`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phien_luyen_tap`
--
ALTER TABLE `phien_luyen_tap`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phong_thach_dau`
--
ALTER TABLE `phong_thach_dau`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `su_kien`
--
ALTER TABLE `su_kien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tai_lieu`
--
ALTER TABLE `tai_lieu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thanh_vien_su_kien`
--
ALTER TABLE `thanh_vien_su_kien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tin_nhan`
--
ALTER TABLE `tin_nhan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tran_dau`
--
ALTER TABLE `tran_dau`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bai_dang`
--
ALTER TABLE `bai_dang`
  ADD CONSTRAINT `bai_dang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `ban_cung_tien`
--
ALTER TABLE `ban_cung_tien`
  ADD CONSTRAINT `ban_cung_tien_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ban_cung_tien_ibfk_2` FOREIGN KEY (`friend_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `bao_cao_thong_ke`
--
ALTER TABLE `bao_cao_thong_ke`
  ADD CONSTRAINT `bao_cao_thong_ke_ibfk_1` FOREIGN KEY (`quan_tri_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `bao_cao_vi_pham`
--
ALTER TABLE `bao_cao_vi_pham`
  ADD CONSTRAINT `bao_cao_vi_pham_ibfk_1` FOREIGN KEY (`nguoi_bao_cao_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bao_cao_vi_pham_ibfk_2` FOREIGN KEY (`bai_dang_id`) REFERENCES `bai_dang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bao_cao_vi_pham_ibfk_3` FOREIGN KEY (`nguoi_bi_bao_cao_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`bai_dang_id`) REFERENCES `bai_dang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `cau_hoi`
--
ALTER TABLE `cau_hoi`
  ADD CONSTRAINT `cau_hoi_ibfk_1` FOREIGN KEY (`bo_de_id`) REFERENCES `bo_de` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `cuoc_tro_chuyen_thanh_vien`
--
ALTER TABLE `cuoc_tro_chuyen_thanh_vien`
  ADD CONSTRAINT `cuoc_tro_chuyen_thanh_vien_ibfk_1` FOREIGN KEY (`cuoc_tro_chuyen_id`) REFERENCES `cuoc_tro_chuyen` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cuoc_tro_chuyen_thanh_vien_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `ho_so_ca_nhan`
--
ALTER TABLE `ho_so_ca_nhan`
  ADD CONSTRAINT `ho_so_ca_nhan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `luot_chia_se`
--
ALTER TABLE `luot_chia_se`
  ADD CONSTRAINT `luot_chia_se_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `luot_chia_se_ibfk_2` FOREIGN KEY (`bai_dang_id`) REFERENCES `bai_dang` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `luot_thich`
--
ALTER TABLE `luot_thich`
  ADD CONSTRAINT `luot_thich_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `luot_thich_ibfk_2` FOREIGN KEY (`bai_dang_id`) REFERENCES `bai_dang` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `phien_luyen_tap`
--
ALTER TABLE `phien_luyen_tap`
  ADD CONSTRAINT `phien_luyen_tap_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `phong_thach_dau`
--
ALTER TABLE `phong_thach_dau`
  ADD CONSTRAINT `phong_thach_dau_ibfk_1` FOREIGN KEY (`bo_de_id`) REFERENCES `bo_de` (`id`);

--
-- Các ràng buộc cho bảng `tai_lieu`
--
ALTER TABLE `tai_lieu`
  ADD CONSTRAINT `tai_lieu_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `thanh_vien_su_kien`
--
ALTER TABLE `thanh_vien_su_kien`
  ADD CONSTRAINT `thanh_vien_su_kien_ibfk_1` FOREIGN KEY (`su_kien_id`) REFERENCES `su_kien` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `thanh_vien_su_kien_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  ADD CONSTRAINT `thong_bao_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `tin_nhan`
--
ALTER TABLE `tin_nhan`
  ADD CONSTRAINT `tin_nhan_ibfk_1` FOREIGN KEY (`cuoc_tro_chuyen_id`) REFERENCES `cuoc_tro_chuyen` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tin_nhan_ibfk_2` FOREIGN KEY (`sender_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `tran_dau`
--
ALTER TABLE `tran_dau`
  ADD CONSTRAINT `tran_dau_ibfk_1` FOREIGN KEY (`phong_thach_dau_id`) REFERENCES `phong_thach_dau` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tran_dau_ibfk_2` FOREIGN KEY (`nguoi_choi_1_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tran_dau_ibfk_3` FOREIGN KEY (`nguoi_choi_2_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_hang_tho`
--
ALTER TABLE `user_hang_tho`
  ADD CONSTRAINT `user_hang_tho_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_hang_tho_ibfk_2` FOREIGN KEY (`hang_tho_id`) REFERENCES `hang_tho` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_phong_thach_dau`
--
ALTER TABLE `user_phong_thach_dau`
  ADD CONSTRAINT `user_phong_thach_dau_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_phong_thach_dau_ibfk_2` FOREIGN KEY (`phong_thach_dau_id`) REFERENCES `phong_thach_dau` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
