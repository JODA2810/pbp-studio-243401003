# guyub 

Studio Pertemuan 6, IF24502 Pemrograman Berbasis Platform.
Aplikasi Flutter kecil dengan dua layar: daftar kartu backlog dan detail kartu.

## Fitur
- Layar daftar: lima kartu dengan judul, kunci, penanggung jawab, dan status.
- Layar detail: judul, kunci, jenis, poin, penanggung jawab, dan status.
- Tombol "Pindah ke ..." memindah status berurutan: To Do, In Progress, Review, Done.
- Di Done, tombol bertuliskan "Sudah Done" dan tidak bisa ditekan.
- Kartu tanpa penanggung jawab (GYB-005) tidak bisa dipindah, dan alasannya tertulis.

## Batas yang disengaja
Saat kembali ke daftar, status di daftar belum ikut berubah. Membagi state antar layar dibahas di Pertemuan 9.

## Cara menjalankan
```
flutter pub get
flutter run -d chrome
```

## Pemakaian AI
- Alat: Claude (Anthropic).
- Dipakai untuk: menjelaskan pesan error dari `flutter analyze`, memeriksa kode terhadap spesifikasi (misalnya data GYB-005 yang salah dan `DetailKartu` yang belum ada), dan menyusun kode layar detail serta tombol pindah (langkah B1 dan B2).
- Yang saya kerjakan sendiri: membuat proyek, menempel dan menjalankan kode, menguji semua perilaku di Chrome, dan melakukan commit serta push.