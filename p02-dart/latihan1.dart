/*
 * JAWABAN PERTANYAAN LATIHAN 1:
 * - Perbedaan: `final nama = 'Andi'` bernilai immutable (hanya bisa diisi 1 kali saat runtime dan tidak bisa diubah).
 *   Sedangkan `String nama = 'Andi'` bernilai mutable (bisa diubah nilainya nanti).
 * - Yang boleh diganti isinya nanti: `String nama = 'Andi'`.
 */

void main() {
  print('Halo, Pemrograman Berbasis Platform');
  final nama = 'Andi';
  print('Nama saya $nama');
}