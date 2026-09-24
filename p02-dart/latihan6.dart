const katalog = <String, int>{
  'kopi': 8000,
  'teh': 5000,
  'jus': 12000,
  'roti': 7000,
};

String struk({
  required String pembeli,
  required List<String> pesanan,
  int diskonPersen = 0,
  int batasDiskon = 20000,
}) {
  int total = 0;
  List<String> tidakAda = [];

  for (var item in pesanan) {
    if (katalog.containsKey(item)) {
      total += katalog[item]!;
    } else {
      tidakAda.add(item);
    }
  }

  int potongan = 0;
  int persentaseTerpakai = 0;

  if (total >= batasDiskon) {
    persentaseTerpakai = diskonPersen;
    potongan = (total * diskonPersen / 100).round();
  }

  int dibayar = total - potongan;

  String hasil = 'Struk untuk $pembeli\n'
      'Jumlah barang : ${pesanan.length}\n'
      'Total         : $total\n'
      'Diskon        : $persentaseTerpakai persen, potongan $potongan\n'
      'Dibayar       : $dibayar';

  if (tidakAda.isNotEmpty) {
    hasil += '\nTidak ada di katalog: ${tidakAda.join(', ')}';
  }

  return hasil;
}

void main() {
  print(struk(pembeli: 'Andi', pesanan: ['kopi', 'teh'], diskonPersen: 10));
  print('-----------------------------------');
  print(struk(pembeli: 'Budi', pesanan: ['kopi', 'jus', 'roti'], diskonPersen: 10));
  print('-----------------------------------');
  print(struk(pembeli: 'Cindy', pesanan: ['kopi', 'roti', 'sate'], diskonPersen: 10));
}