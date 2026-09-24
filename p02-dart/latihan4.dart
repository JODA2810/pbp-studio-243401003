/*
 * JAWABAN PERTANYAAN LATIHAN 4:
 * - Tipe yang dikembalikan Dart saat menulis daftar[nama]: `int?` (nullable integer).
 * - Alasan: Kunci (key) yang dicari pada Map belum tentu ada. Jika kunci tersebut
 *   tidak ditemukan (seperti 'susu'), Dart akan mengembalikan nilai `null`.
 */

int cariHarga(Map<String, int> daftar, String nama) {
  return daftar[nama] ?? 0;
}

void main() {
  final harga = {'kopi': 8000, 'teh': 5000, 'jus': 12000};
  print('Harga kopi: ${cariHarga(harga, 'kopi')}');
  print('Harga susu: ${cariHarga(harga, 'susu')}');
}