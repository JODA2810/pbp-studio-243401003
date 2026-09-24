String rangkum({required String nama, int diskon = 0, String? catatan}) {
  String hasil = '$nama mendapat diskon$diskon persen';
  if (catatan != null) {
    hasil += '. Catatan: $catatan';
  }
  return hasil;
}

void main() {
  print(rangkum(nama: 'Andi'));
  print(rangkum(nama: 'Budi', diskon: 10));
  print(rangkum(nama: 'Cindy', diskon: 25, catatan: 'pelanggan tetap'));
}