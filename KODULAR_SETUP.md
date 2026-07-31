# 🎾 KODULAR SETUP - WinFit_App

## 📱 Tutorial Lengkap Membuat APK di HP

### **STEP 1: Akses Kodular**

1. **Buka browser HP** → Chrome, Firefox, atau browser lain
2. **Ketik URL:** `https://www.kodular.io/`
3. **Klik tombol** "Create New App" atau "Sign In" (jika sudah punya akun)
4. **Login/Register** dengan email Anda

---

### **STEP 2: Buat Project Baru**

1. Klik **"Create New App"**
2. Beri nama: **WinFit_App**
3. Pilih template: **Blank Project**
4. Klik **"Create"**
5. **Tunggu editor terbuka** (~30 detik)

---

### **STEP 3: Setup Screen Pertama (Splash Screen)**

#### 🎨 **Designer Tab:**

**Tambah Komponen:**

1. **Top Bar:**
   - Drag: **HorizontalArrangement** → set Height: 100, BackgroundColor: #0066CC
   - Drag: **Image** → ke dalam arrangement
     - Set Size: 60x60
     - Upload logo/icon WinFit (atau gunakan emoji 🎾)
   - Drag: **Label** → teks "WinFit_App"
     - TextSize: 24, TextColor: #FFFFFF, FontBold: true

2. **Center Content:**
   - Drag: **VerticalArrangement** (middle)
   - Drag 2x **Label** ke dalam:
     - Label 1: "WINFIT_APP" (size 28, bold, biru)
     - Label 2: "Stok Opname Profesional" (size 14, pink #FF1493)

3. **Bottom:**
   - Drag: **ProgressBar** (untuk loading effect)
     - Warna: #0066CC

4. **Hidden Components:**
   - Drag: **Clock** (untuk timer)
   - Drag: **TinyDB** (untuk database)

---

### **STEP 4: Setup Screen Kedua (Home/Dashboard)**

#### 🎨 **Designer Tab:**

**Layout Structure:**
```
┌─── Header (Biru) ───┐
│  WinFit_App         │
├──────────────────────┤
│  📊 Total Stok: 150  │
│  🔔 Sedikit: 3       │
│  📦 Kategori: 12     │
├──────────────────────┤
│  [+ Tambah Barang]   │
│  [📋 Lihat Daftar]   │
│  [⚙️ Pengaturan]     │
└──────────────────────┘
```

**Komponen:**

1. **Header** (HorizontalArrangement)
   - BackgroundColor: #0066CC
   - Height: 80
   - Isi: Image + Label "WinFit_App" (putih)

2. **Info Cards** (VerticalArrangement)
   - Card 1: "📊 Total Stok: 150" (Label with number)
   - Card 2: "🔔 Barang Sedikit: 3" (Label with alert)
   - Card 3: "📦 Kategori: 12" (Label)

3. **Action Buttons** (3x Button)
   - Button 1: "+ Tambah Barang" (BackgroundColor: #0066CC)
   - Button 2: "📋 Lihat Daftar" (BackgroundColor: #FF1493)
   - Button 3: "⚙️ Pengaturan" (BackgroundColor: #CCCCCC)
   - Semua: TextColor putih, Bold

---

### **STEP 5: Setup Screen Ketiga (Input Barang)**

#### 🎨 **Designer Tab:**

**Form Input:**

1. **Header** (HorizontalArrangement)
   - BackgroundColor: #FF1493
   - Label: "Tambah Barang Baru"

2. **Form Fields** (VerticalArrangement):
   - **Label + TextBox** "Nama Barang"
   - **Label + TextBox** "Jumlah Stok"
   - **Label + Spinner/Dropdown** "Kategori" (Minuman, Snack, Equipment)
   - **Label + TextBox** "Lokasi Gudang"
   - **Label + TextBox** "Batas Minimum"
   - **DatePicker** "Tanggal Barang Masuk"

3. **Buttons** (HorizontalArrangement):
   - Button "Simpan" (Hijau #00AA00)
   - Button "Batal" (Merah #CC0000)

---

### **STEP 6: Setup Screen Keempat (Daftar Stok)**

#### 🎨 **Designer Tab:**

1. **Search Bar** (TextBox + Button)
   - TextBox: "Cari barang..."
   - Button: "🔍 Cari"

2. **ListView**
   - Drag: **ListView**
   - Set Height: Fill parent
   - Ini akan menampilkan daftar barang dari database

3. **Hidden Notifier**
   - Drag: **Notifier** (untuk delete/edit actions)

---

### **STEP 7: Kode Blok (Blocks Tab)**

#### 🔧 **Block 1: Splash Screen (Auto Open Home)**

```
WHEN Screen1.Initialize DO:
  CALL Clock.Timer (1000ms)
END WHEN

WHEN Clock.Timer DO:
  CALL Screen2.Open()
END WHEN
```

#### 🔧 **Block 2: Tombol Tambah Barang**

```
WHEN BtnTambahBarang.Click DO:
  CALL Screen3.Open()  // Buka screen input
END WHEN
```

#### 🔧 **Block 3: Simpan Data Barang**

```
WHEN BtnSimpan.Click DO:
  SET TinyDB.Store(
    tag: "Barang_" + Clock.Now(),
    value: {
      nama: TxtNamaBarang.Text,
      jumlah: TxtJumlahStok.Text,
      minimum: TxtMinimum.Text,
      kategori: DDKategori.Selection,
      lokasi: TxtLokasi.Text,
      tanggal: DatePicker.Date
    }
  )
  
  IF TxtJumlahStok.Text ≤ TxtMinimum.Text THEN
    CALL Notifier.ShowNotification(
      title: "⚠️ STOK SEDIKIT",
      message: TxtNamaBarang.Text + " stok hanya " + TxtJumlahStok.Text + " unit"
    )
  END IF
  
  CALL Notifier.ShowAlert("✅ Barang berhasil disimpan!")
  CALL Screen2.Open()
END WHEN
```

#### 🔧 **Block 4: Load Daftar Barang**

```
WHEN Screen4.Initialize DO:
  SET ListBarang = TinyDB.GetAll()
  
  FOR EACH item IN ListBarang DO:
    CALL ListView.AddItem(
      item.nama + " | " + item.jumlah + " | " + item.status
    )
  END FOR
END WHEN
```

#### 🔧 **Block 5: Delete Barang (Long Click)**

```
WHEN ListView.LongClick(index) DO:
  CALL TinyDB.Remove(tag: selected_key)
  CALL Notifier.ShowAlert("❌ Barang dihapus!")
  CALL Screen4.Initialize()  // Refresh list
END WHEN
```

---

### **STEP 8: Permissions**

Di Kodular, setting permissions:

1. Klik **"Build"** menu
2. Pilih **"App Inventor Permissions"**
3. Centang:
   - ✅ Internet
   - ✅ Notifications
   - ✅ Write to storage

---

### **STEP 9: Build APK**

1. Klik menu **"Build"** (atas kanan)
2. Pilih **"Build APK"** atau **"Build IPA"**
3. **Tunggu proses** (~2-5 menit)
4. Akan muncul notifikasi "APK ready"
5. **Download** ke HP Anda

---

### **STEP 10: Install APK**

1. Buka **File Manager** HP
2. Cari folder **Download**
3. Cari file `WinFit_App.apk`
4. **Tap file** untuk install
5. Klik **"Install"**
6. Tunggu selesai
7. Klik **"Open"** untuk jalankan app

---

## ✅ Checklist Kompetensi

- [ ] Sudah buat akun Kodular
- [ ] Sudah buat project "WinFit_App"
- [ ] Sudah buat 4 screen
- [ ] Sudah tambah semua komponen
- [ ] Sudah tambah blok logika
- [ ] Sudah set permissions
- [ ] Sudah build APK
- [ ] Sudah install di HP
- [ ] Sudah test aplikasi

---

## 🎯 Testing Checklist

Setelah install, test:

1. ✅ Splash screen muncul 2 detik
2. ✅ Home screen terbuka
3. ✅ Tombol "Tambah Barang" bekerja
4. ✅ Form input bisa diisi
5. ✅ Data tersimpan di database
6. ✅ Notifikasi muncul saat stok minimum
7. ✅ Daftar barang tampil dengan benar
8. ✅ Delete/edit berfungsi

---

## 🆘 Troubleshooting

| Error | Solusi |
|-------|--------|
| **APK tidak bisa download** | Refresh halaman, atau coba browser lain |
| **Notifikasi tidak muncul** | Cek permissions di settings HP |
| **Data tidak tersimpan** | Pastikan TinyDB sudah ditambah di blocks |
| **ListViewtidak menampilkan data** | Refresh screen atau restart app |

---

**Selamat membuat APK! 🚀**
