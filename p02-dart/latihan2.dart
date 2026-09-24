/*
 * JAWABAN PERTANYAAN LATIHAN 2:
 * - Pesan galat saat memanggil total('8000', 3):
 *   "The argument type 'String' can't be assigned to the parameter type 'int'."
 */

int total(int harga, int jumlah) => harga * jumlah;

void main() {
  int hasil = total(8000, 3);
  print('Total belanja: $hasil');
}