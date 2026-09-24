# Laporan Studio Dart Pertemuan 2 - PBP

**NIM:** 243401003  
**Mata Kuliah:** Pemrograman Berbasis Platform  

---

## Jawaban Pertanyaan Lembar Kerja

### Latihan 1: Cetak dan Variabel
* **Pertanyaan:** Apa bedanya `final nama = 'Andi'` dengan `String nama = 'Andi'`? Mana yang boleh diganti isinya nanti?
* **Jawaban:** 
  * `final nama = 'Andi'` bersifat *immutable* (nilainya hanya diisi satu kali saat *runtime* dan tidak bisa diubah lagi setelahnya).
  * `String nama = 'Andi'` bersifat *mutable* (nilainya bisa diubah/diganti di baris kode berikutnya).
  * Yang **boleh diganti** isinya nanti adalah `String nama = 'Andi'`.

---

### Latihan 2: Fungsi dengan Tipe
* **Pertanyaan:** Tulis pesan galat saat memanggil `total('8000', 3)`.
* **Jawaban:** 
  `The argument type 'String' can't be assigned to the parameter type 'int'.`

---

### Latihan 3: Daftar dan Rata-Rata
* **Pertanyaan:** Mengapa tipe kembaliannya `double` dan bukan `int`?
* **Jawaban:** Karena pembagian angka di Dart yang menggunakan operator pembagian `/` selalu mengembalikan nilai pecahan/desimal bertipe `double`, meskipun angka yang dibagi bertipe integer (seperti $245 / 3 = 81.66666666666667$).

---

### Latihan 4: Map dan Nilai yang Bisa Null
* **Pertanyaan:** Ketika Anda menulis `daftar[nama]`, tipe apa yang dikembalikan Dart, dan mengapa bukan `int` saja?
* **Jawaban:**
  * Tipe yang dikembalikan adalah **`int?`** (*nullable integer*).
  * Alasan: Kunci (*key*) barang yang dicari pada `Map` belum tentu ada di dalam daftar. Jika barang tidak ditemukan (misalnya `'susu'`), Dart akan mengembalikan nilai `null`. Oleh sebab itu tipenya harus *nullable* (`int?`).

---

### Latihan 5: Parameter Bernama
* **Pertanyaan:** Kalau `required` dihapus dari `nama`, apa yang terjadi, dan mengapa Dart tidak mengizinkannya tanpa nilai bawaan?
* **Jawaban:**
  * **Yang terjadi:** Dart menampilkan error kompilasi: `The parameter 'nama' can't have a value of 'null' because its type is 'String'...`.
  * **Alasan:** Tipe `String` bersifat *non-nullable* (tidak boleh bernilai `null`). Parameter bernama bersifat opsional saat pemanggilan fungsi. Tanpa kata kunci `required` atau *default value*, nilainya secara otomatis diisi `null`, yang melanggar aturan *Sound Null Safety* pada Dart.

---

### Latihan 6: Tingkat Menengah
* **Pertanyaan:** Mengapa daftar barang tak dikenal lebih baik dikembalikan kepada pemanggil daripada langsung dicetak dari dalam fungsi penghitung?
* **Jawaban:** Mengikuti prinsip *Separation of Concerns* (pemisahan logika bisnis/penghitungan dengan tampilan antarmuka). Jika fungsi langsung mencetak dengan `print()`, fungsi tersebut menjadi kaku dan tidak bisa dipakai ulang (*reusable*) jika nantinya logika ini diterapkan pada aplikasi berbasis Flutter/UI Web maupun API Server.