#  Wakeup Social Cafe Manager

Aplikasi manajemen menu digital untuk pegawai Wakeup Social Cafe.

<img width="1301" height="881" alt="image" src="https://github.com/user-attachments/assets/55bf4cbf-95d8-44ae-922a-ca6d062cb15f" />


<img width="1299" height="881" alt="image" src="https://github.com/user-attachments/assets/bdcc4223-450c-4067-8de3-cef990114c57" />


##  Deskripsi Aplikasi

**Wakeup Social Cafe Manager** adalah aplikasi mobile berbasis Flutter yang digunakan oleh pegawai cafe untuk mengelola data menu kopi dan minuman secara digital. Aplikasi ini memungkinkan pegawai untuk menambah, melihat, mengedit, dan menghapus data menu yang tersedia di cafe dengan antarmuka yang sederhana dan mudah digunakan.

Aplikasi ini terintegrasi dengan backend **Supabase** untuk penyimpanan data real-time, sehingga perubahan data langsung tersinkronisasi di semua perangkat.

## Fitur Aplikasi

### 1. Create (Tambah Menu)
- Menambahkan menu baru ke database Supabase
- Form input dengan validasi data
- Feedback sukses/error dengan SnackBar

<img width="1267" height="171" alt="image" src="https://github.com/user-attachments/assets/0ddea9b2-a529-43cf-967e-6dfe92254750" />


### 2. Read (Lihat Menu)
- Menampilkan daftar semua menu dari database
- Format harga dalam Rupiah (Rp)
- Pull-to-refresh untuk update data terbaru
- Tampilan empty state jika belum ada menu

<img width="1291" height="605" alt="image" src="https://github.com/user-attachments/assets/91cb64ec-7548-495e-9d27-381dad0907b7" />


### 3. Update (Edit Menu)
- Mengedit data menu yang sudah ada
- Form pre-filled dengan data lama
- Validasi sebelum menyimpan perubahan

<img width="1301" height="886" alt="image" src="https://github.com/user-attachments/assets/99dc8513-8397-4d37-98f4-df81eccea371" />


### 4. Delete (Hapus Menu)
- Menghapus menu dari database
- Dialog konfirmasi sebelum menghapus
- Mencegah penghapusan tidak sengaja

<img width="1302" height="888" alt="image" src="https://github.com/user-attachments/assets/2e5c4df9-2300-4ce9-80b4-093d8a15773c" />


### 5. Navigasi
- Navigasi antar halaman menggunakan Navigator
- Halaman List Menu (Home)
- Halaman Form Tambah/Edit Menu

##  Widget yang Digunakan

| Widget | Fungsi |
|--------|--------|
| **Scaffold** | Struktur dasar halaman dengan AppBar dan body |
| **AppBar** | Header aplikasi dengan judul dan tema cafe |
| **ListView** | Menampilkan daftar menu dalam bentuk list |
| **Card** | Container untuk setiap item menu dengan elevation |
| **TextField** | Input field untuk nama, harga, dan deskripsi menu |
| **ElevatedButton** | Tombol aksi simpan dan konfirmasi |
| **FloatingActionButton** | Tombol tambah menu di halaman utama |
| **Navigator** | Navigasi push/pop antar halaman List dan Form |
| **FutureBuilder** | Mengambil dan menampilkan data dari Supabase secara async |
| **TextFormField** | Input field dengan validasi form |
| **RefreshIndicator** | Pull-to-refresh untuk reload data |
| **SnackBar** | Menampilkan pesan sukses/error |
| **AlertDialog** | Dialog konfirmasi untuk hapus menu |
| **CircularProgressIndicator** | Loading indicator saat fetch data |
| **Icon** | Ikon-ikon untuk UI (coffee, edit, delete, dll) |
