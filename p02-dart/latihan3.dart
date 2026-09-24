/*
 * JAWABAN PERTANYAAN LATIHAN 3:
 * - Mengapa tipe kembaliannya double dan bukan int?
 *   Karena pembagian dua angka di Dart menggunakan operator `/` selalu menghasilkan
 *   bilangan desimal/pecahan (`double`), meskipun angka yang dibagi bertipe integer (misal: 245 / 3 = 81.66666666666667).
 */

double rataRata(List<int> nilai) {
  if (nilai.isEmpty) {
    return 0.0;
  }
  int jumlah = 0;
  for (int n in nilai) {
    jumlah += n;
  }
  return jumlah / nilai.length;
}

void main() {
  print('Rata-rata: ${rataRata([80, 90, 75])}');
  print('Rata-rata daftar kosong: ${rataRata([])}');
}