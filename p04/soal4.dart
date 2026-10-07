int getHargaBarang(Map<String, int> katalog, String barang) {
  return katalog[barang] ?? 0;
}

int totalHargaPesanan(Map<String, int> katalog, List<String> pesanan) {
  int total = 0;
  for (String barang in pesanan) {
    total += katalog[barang] ?? 0;
  }
  return total;
}

void main() {
  final Map<String, int> katalog = {
    'Buku': 15000,
    'Pensil': 3000,
    'Penggaris': 5000,
    'Penghapus': 2000,
    'Spidol': 8000,
  };

  print('Harga Pensil: ${getHargaBarang(katalog, 'Pensil')}');
  print('Harga Tipe-X: ${getHargaBarang(katalog, 'Tipe-X')}');

  List<String> pesanan = ['Buku', 'Pensil', 'Tipe-X', 'Spidol'];
  print('Total Pesanan: ${totalHargaPesanan(katalog, pesanan)}');
}