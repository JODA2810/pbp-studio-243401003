int cariHarga(Map<String, int> daftar, String nama) {
  return daftar[nama] ?? 0;
}

void main() {
  final harga = {'kopi': 8000, 'teh': 5000, 'jus': 12000};
  print('Harga kopi: ${cariHarga(harga, 'kopi')}');
  print('Harga susu: ${cariHarga(harga, 'susu')}');
}