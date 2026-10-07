List<String> tampilanKeranjang({
  required List<String> barang,
  required Map<String, int> harga,
  bool sedangMemuat = false,
  String? galat,
}) {
  if (sedangMemuat) {
    return ['Sedang memuat data keranjang...'];
  }
  if (galat != null) {
    return ['Gagal memuat data: $galat', 'Silakan coba lagi.'];
  }
  if (barang.isEmpty) {
    return ['Keranjang belanja Anda kosong.', 'Silakan pilih barang terlebih dahulu.'];
  }

  List<String> hasil = [];
  int total = 0;
  for (String item in barang) {
    int hargaItem = harga[item] ?? 0;
    total += hargaItem;
    hasil.add('$item: Rp $hargaItem');
  }
  hasil.add('Total: Rp $total');
  return hasil;
}

void main() {
  final Map<String, int> katalog = {'Buku': 10000, 'Pensil': 2000};

  print('--- Keadaan 1 (Sedang Memuat) ---');
  print(tampilanKeranjang(barang: ['Buku'], harga: katalog, sedangMemuat: true));

  print('--- Keadaan 2 (Galat) ---');
  print(tampilanKeranjang(barang: ['Buku'], harga: katalog, galat: 'Koneksi terputus'));

  print('--- Keadaan 3 (Keranjang Kosong) ---');
  print(tampilanKeranjang(barang: [], harga: katalog));

  print('--- Keadaan 4 (Ada Data) ---');
  print(tampilanKeranjang(barang: ['Buku', 'Pensil', 'Penghapus'], harga: katalog));
}