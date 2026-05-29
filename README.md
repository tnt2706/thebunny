# TheBunny — System Design Report

Báo cáo phân tích thiết kế hướng đối tượng cho nền tảng mạng xã hội học tập **TheBunny**.
Đồ án Cơ sở dữ liệu · Nhóm 10 · Năm học 2026.

---

## Cấu trúc thư mục

```
thebunny/
├── index.html              # Trang báo cáo chính (single-page, render PlantUML từ CDN)
├── README.md               # File này
├── thebunny_nhom10.sql     # Schema MariaDB (25 bảng)
├── docs/                   # Tài liệu nguồn (markdown, ghi chú thiết kế)
└── uml/                    # 6 file PlantUML — sơ đồ UML 2.5
    ├── 01-class-diagram.puml          # Class diagram (v1)
    ├── 01-v2-class-diagram.puml       # Class diagram (v2, có domain packages)
    ├── 02-usecase-diagram.puml        # Use Case Diagram
    ├── 03-sequence-diagrams.puml      # 3 sequence diagrams (post / PvP / report)
    ├── 04-state-diagrams.puml         # 3 state machines (match / report / friend)
    ├── 05-component-diagram.puml      # Component Diagram (3-tier)
    ├── 06-deployment-diagram.puml     # Deployment Diagram
    └── README.md                      # Mô tả các file UML
```

> Lưu ý: `index.html` **không phụ thuộc** vào các file `.puml` trong `uml/` — toàn bộ mã PlantUML được nhúng trực tiếp trong HTML và render qua plantuml.com / kroki.io.
> Các file `.puml` rời dành cho việc xuất SVG/PNG offline hoặc chỉnh sửa độc lập.

---

## Cách mở báo cáo

### Cách 1 — VS Code Live Server + Markdown Preview (khuyến nghị)

**Cài 2 extension:**

- [**Live Server**](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) — chạy `index.html` với auto-reload.
- [**Markdown All in One**](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) — preview file `.md` (như `README.md`) đẹp ngay trong VS Code, có TOC + shortcut.

Cài nhanh qua terminal:

```bash
code --install-extension ritwickdey.LiveServer
code --install-extension yzhang.markdown-all-in-one
```

**Sử dụng:**

1. Mở thư mục `thebunny/` trong VS Code:

   ```bash
   code /Users/tinhtran/Work/love/thebunny
   ```

2. **Chạy báo cáo HTML:** Click chuột phải vào `index.html` → chọn **"Open with Live Server"**
   (hoặc click nút **"Go Live"** ở thanh status bar dưới cùng).
   Trình duyệt sẽ tự mở `http://127.0.0.1:5500/index.html` và reload mỗi khi file thay đổi.

3. **Xem preview Markdown (file `.md`):**
   - Mở `README.md` → nhấn `Cmd+K V` (Mac) / `Ctrl+K V` (Win/Linux) — preview cạnh bên.
   - Hoặc `Cmd+Shift+V` — preview full tab.
   - Phím tắt khác: `Cmd+B` bold · `Cmd+I` italic · `Cmd+Shift+]` heading +1.

### Cách 2 — Mở file trực tiếp

Double-click vào `index.html` để mở bằng trình duyệt mặc định.

> ⚠️ Một số trình duyệt chặn `fetch()` qua giao thức `file://` vì lý do bảo mật → sơ đồ PlantUML có thể không render. Khuyến nghị dùng Live Server.

### Cách 3 — Python HTTP server (không cần extension)

```bash
cd /Users/tinhtran/Work/love/thebunny
python3 -m http.server 5500
```

Sau đó mở `http://localhost:5500` trong trình duyệt.

### Cách 4 — Node.js (nếu cài npm)

```bash
cd /Users/tinhtran/Work/love/thebunny
npx serve .
```

---

## Render sơ đồ PlantUML offline (tuỳ chọn)

Nếu muốn xuất sơ đồ ra file SVG/PNG riêng (không qua internet):

```bash
# macOS — cài PlantUML
brew install plantuml

# Render tất cả sơ đồ trong thư mục uml/ ra SVG
plantuml -tsvg uml/*.puml

# Hoặc render ra PNG
plantuml -tpng uml/*.puml
```

File output sẽ nằm cùng thư mục với file `.puml` nguồn.

---

## Tech stack

| Thành phần    | Công nghệ                                         |
| ------------- | ------------------------------------------------- |
| Database      | MariaDB 10.4 · phpMyAdmin 5.2.1                   |
| Backend       | PHP 8.0.30 · Apache 2.4 / Nginx                   |
| Frontend      | HTML5 · Tailwind CSS (CDN) · Inter font           |
| UML rendering | PlantUML 2.5 · plantuml.com / kroki.io            |
| Báo cáo       | Single-page HTML, in được sang PDF từ trình duyệt |

---

## Xuất báo cáo ra PDF

1. Mở `index.html` bằng Live Server.
2. Nhấn nút **PDF** ở góc phải nav bar (hoặc `Cmd+P` / `Ctrl+P`).
3. Chọn **"Save as PDF"** trong destination.
4. Đảm bảo bật **"Background graphics"** để giữ màu nền giấy.

---

## Cấu trúc nội dung (12 chương)

| Chương | Tiêu đề        | Mô tả                                         |
| ------ | -------------- | --------------------------------------------- |
| I      | Tổng quan      | Bảy phân hệ và User trung tâm                 |
| II     | Kiến trúc      | Kiến trúc ba lớp + Component Diagram          |
| III    | Class Diagram  | Sơ đồ lớp đầy đủ (25 entities, 7 enums)       |
| IV     | Phân hệ        | Chi tiết bảy domain                           |
| V      | Use Cases      | Bốn vai trò × mười lăm use case               |
| VI     | State Machines | Vòng đời TranDau · BaoCaoViPham · BanCungTien |
| VII    | Sequence       | Ba luồng nghiệp vụ chính                      |
| VIII   | Deployment     | Kiến trúc triển khai vật lý                   |
| IX     | Phân quyền     | CRUD Matrix theo vai trò                      |
| X      | Patterns       | Sáu pattern thiết kế áp dụng                  |
| XI     | Rules          | Mười lăm quy tắc nghiệp vụ                    |
| XII    | Glossary       | Đối chiếu SQL ↔ OOP ↔ English                 |

---

## Nhóm thực hiện

**Nhóm 10** — Đồ án Cơ sở dữ liệu · Năm học 2026
Phiên bản v1.0 — Final · 28 · 05 · 2026

---

## License

MIT
