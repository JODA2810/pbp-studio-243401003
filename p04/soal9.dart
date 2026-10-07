Map<String, Object> tanganiPermintaan(Map<String, String> kueri) {
  final Map<String, int> katalog = {
    'laptop': 10000000,
    'mouse': 150000,
    'keyboard': 300000,
  };

  if (!kueri.containsKey('barang') || kueri['barang']!.trim().isEmpty) {
    return {
      'status': 400,
      'pesan': 'Parameter "barang" wajib diisi dan tidak boleh kosong.'
    };
  }

  String namaBarang = kueri['barang']!.toLowerCase();
  int jumlah = 1;

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

  if (!katalog.containsKey(namaBarang)) {
    return {
      'status': 404,
      'pesan': 'Barang "$namaBarang" tidak ditemukan dalam katalog.'
    };
  }

  int totalHarga = katalog[namaBarang]! * jumlah;
  return {
    'status': 200,
    'barang': namaBarang,
    'jumlah': jumlah,
    'total': totalHarga,
  };
}

void main() {
  print(tanganiPermintaan({}));
  print(tanganiPermintaan({'barang': 'mouse', 'jumlah': 'abc'}));
  print(tanganiPermintaan({'barang': 'mouse', 'jumlah': '0'}));
  print(tanganiPermintaan({'barang': 'monitor'}));
  print(tanganiPermintaan({'barang': 'mouse'}));
  print(tanganiPermintaan({'barang': 'keyboard', 'jumlah': '2'}));
}