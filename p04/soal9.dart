Map<String, Object> tanganiPermintaan(Map<String, String> kueri) {
  final Map<String, int> katalog = {
    'laptop': 10000000,
    'mouse': 150000,
    'keyboard': 300000,
  };

  // 1. Parameter barang tidak ada atau kosong
  if (!kueri.containsKey('barang') || kueri['barang']!.trim().isEmpty) {
    return {
      'status': 400,
      'pesan': 'Parameter "barang" wajib diisi dan tidak boleh kosong.'
    };
  }

  String namaBarang = kueri['barang']!.toLowerCase();
  int jumlah = 1;

  // 2. Parameter jumlah ada tetapi bukan angka / kurang dari 1
  if (kueri.containsKey('jumlah')) {
    int? parsedJumlah = int.tryParse(kueri['jumlah']!);
    if (parsedJumlah == null) {
      return {
        'status': 400,
        'pesan': 'Nilai jumlah "${kueri['jumlah']}" bukan angka yang valid.'
      };
    }
    if (parsedJumlah < 1) {
      return {
        'status': 400,
        'pesan': 'Jumlah barang tidak boleh kurang dari 1.'
      };
    }
    jumlah = parsedJumlah;
  }

  // 3. Barang tidak ada di katalog
  if (!katalog.containsKey(namaBarang)) {
    return {
      'status': 404,
      'pesan': 'Barang "$namaBarang" tidak ditemukan dalam katalog.'
    };
  }

  // 4. Semua sah
  int totalHarga = katalog[namaBarang]! * jumlah;
  return {
    'status': 200,
    'barang': namaBarang,
    'jumlah': jumlah,
    'total': totalHarga,
  };
}

void main() {
  // Pengujian 6 keadaan sesuai tabel
  print(tanganiPermintaan({}));                                    // 400: barang tidak ada
  print(tanganiPermintaan({'barang': 'mouse', 'jumlah': 'abc'})); // 400: jumlah bukan angka
  print(tanganiPermintaan({'barang': 'mouse', 'jumlah': '0'}));   // 400: jumlah < 1
  print(tanganiPermintaan({'barang': 'monitor'}));                 // 404: barang tidak ada di katalog
  print(tanganiPermintaan({'barang': 'mouse'}));                   // 200: valid (default jumlah 1)
  print(tanganiPermintaan({'barang': 'keyboard', 'jumlah': '2'}));  // 200: valid dengan jumlah kustom
}