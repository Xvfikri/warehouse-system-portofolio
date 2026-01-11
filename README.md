# Warehouse Management System (WMS)

## 📝 Project Description

**Warehouse Management System (WMS)** adalah solusi perangkat lunak komprehensif yang dirancang untuk mengoptimalkan operasional pergudangan secara efisien dan transparan. Sistem ini memungkinkan perusahaan untuk mengelola siklus hidup barang mulai dari penerimaan (*Inbound*), penyimpanan stok berbasis nomor batch, hingga pengeluaran barang (*Outbound*) berdasarkan permintaan produksi atau penjualan.

Sistem ini dikembangkan untuk meminimalkan kesalahan manusia dalam pencatatan stok, memberikan visibilitas *real-time* terhadap inventaris, dan mempermudah proses audit melalui fitur penyesuaian stok (*Stock Adjustment*) yang terintegrasi dengan alur persetujuan. Dengan dukungan laporan otomatis harian hingga tahunan, WMS ini menjadi alat bantu strategis bagi manajemen dalam pengambilan keputusan terkait ketersediaan barang dan perencanaan logistik.

### Core Objectives:
- **Akurasi Inventaris**: Pelacakan ketat menggunakan sistem nomor batch untuk memastikan rotasi stok yang tepat (FIFO/FEFO).
- **Efisiensi Operasional**: Otomatisasi pencatatan transaksi masuk dan keluar untuk mempercepat alur kerja staf gudang.
- **Transparansi Data**: Memberikan laporan inventaris dan aktivitas gudang yang akurat untuk pengawasan manajerial.
- **Kontrol Ketat**: Sistem persetujuan berjenjang untuk setiap penyesuaian stok yang krusial.

---

## 🚀 Key Features

- **Inventory Tracking**: Manage products, categories, and suppliers with ease.
- **Batch Management**: Track stock levels using batch numbers for better traceability.
- **Goods Movement**: Record and track Inbound and Outbound transactions.
- **Stock Adjustments**: Perform physical stock counts and record adjustments with approval workflows.
- **Reporting**: Generate daily, weekly, monthly, and annual reports in real-time.
- **Role-Based Access Control**: Separate dashboards for Admins, Supervisors, and Warehouse Staff.
- **Low Stock Notifications**: Automated alerts when inventory levels fall below thresholds.

## 📸 Project Previews

### Guest & Landing Page
| Dashboard | Features |
|---|---|
| ![Dashboard](public/GuestDashboard/Dashboard.png) | ![Features](public/GuestDashboard/Features.png) |
| **About Us** | **Login** |
| ![About](public/GuestDashboard/About.png) | ![Login](public/GuestDashboard/Login.png) |

### Admin & Supervisor Dashboard
| Overview Dashboard | User Management |
|---|---|
| ![Dashboard](public/AdminSupervisor/Dashboard.png) | ![User Management](public/AdminSupervisor/UserManagement.png) |

### Inventory & Stock Management
| Inventory List | Inbound Stock |
|---|---|
| ![Inventory](public/AdminSupervisor/InventoryManagement/Approved.png) | ![Inbound](public/AdminSupervisor/Inbound%20And%20Outbond%20stock/ApprovedIbound.png) |
| **Stock Adjustment** | **Inventory Report** |
| ![Adjustment](public/AdminSupervisor/StockAdjusment/PendingRequest.png) | ![Report](public/AdminSupervisor/Report/inventoryReport.png) |

## 🛠️ Tech Stack

- **Framework**: [Laravel 11](https://laravel.com)
- **Styling**: [Tailwind CSS](https://tailwindcss.com)
- **Database**: MySQL / PostgreSQL
- **Frontend Interactivity**: Alpine.js / Blade Components

## ⚙️ Installation

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd warehouse_system
    ```

2.  **Install dependencies**:
    ```bash
    composer install
    npm install
    ```

3.  **Setup environment**:
    ```bash
    cp .env.example .env
    php artisan key:generate
    ```

4.  **Database migration & seeding**:
    ```bash
    php artisan migrate --seed
    ```

5.  **Run the application**:
    ```bash
    npm run dev
    php artisan serve
    ```

## 📄 License

The Warehouse Management System is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
