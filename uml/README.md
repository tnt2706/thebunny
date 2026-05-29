# TheBunny — UML Diagrams (PlantUML)

Bộ tài liệu thiết kế hệ thống OOP/UML cho cơ sở dữ liệu `thebunny_nhom10`.

## 📁 Cấu trúc

| File                         | Loại               | Mô tả                                      |
| ---------------------------- | ------------------ | ------------------------------------------ |
| `01-class-diagram.puml`      | Class Diagram      | Toàn bộ 25 entity + 7 enum + relationships |
| `02-usecase-diagram.puml`    | Use Case Diagram   | 4 actor × các use case nghiệp vụ           |
| `03-sequence-diagrams.puml`  | Sequence Diagram   | 3 luồng: Đăng bài+Bình luận, PvP, Báo cáo  |
| `04-state-diagrams.puml`     | State Machine      | TranDau, BaoCaoViPham, BanCungTien         |
| `05-component-diagram.puml`  | Component Diagram  | Kiến trúc 3-tier theo domain               |
| `06-deployment-diagram.puml` | Deployment Diagram | Hạ tầng triển khai vật lý                  |

## 🚀 Cách mở & render

### Cách 1 — VS Code (khuyên dùng)

1. Cài extension: **PlantUML** (publisher: `jebbs`)
2. Mở file `.puml`
3. Nhấn `Alt+D` (Win/Linux) hoặc `Option+D` (Mac) để xem preview
4. Right-click → **Export Current Diagram** để xuất PNG/SVG/PDF

### Cách 2 — IntelliJ IDEA / PhpStorm

1. Cài plugin **PlantUML Integration**
2. Cài Graphviz: `brew install graphviz` (Mac) hoặc `apt install graphviz` (Linux)
3. Mở file `.puml` → preview tự động hiện bên phải

### Cách 3 — Web (không cần cài)

1. Truy cập [plantuml.com/plantuml](https://www.plantuml.com/plantuml)
2. Copy nội dung file `.puml`, paste vào textbox
3. Xem preview ngay

### Cách 4 — CLI

```bash
# Cài
brew install plantuml         # Mac
apt install plantuml          # Ubuntu

# Render
plantuml 01-class-diagram.puml          # → 01-class-diagram.png
plantuml -tsvg *.puml                   # SVG cho tất cả
plantuml -tpdf 01-class-diagram.puml    # PDF
```

## 🎨 Theme & Style

Tất cả file dùng theme `cerulean-outline` (clean, professional).
Đổi theme bằng cách thay dòng `!theme cerulean-outline` thành:

- `!theme amiga` (retro)
- `!theme mars` (red/dark)
- `!theme vibrant` (colorful)
- Xem thêm: [PlantUML themes](https://the-lum.github.io/puml-themes-gallery/)

## 📊 Xuất batch ra PNG

```bash
cd uml/
plantuml -o exports/ *.puml
```

Tất cả PNG sẽ nằm trong `uml/exports/`.

## 🔗 Liên quan

- **HTML trực quan:** `../thebunny_system_design.html` — mở bằng browser
- **Schema SQL:** `../thebunny_nhom10 (1).sql`
- **Spec design:** `../docs/superpowers/specs/2026-05-28-thebunny-oop-uml-design.md`
