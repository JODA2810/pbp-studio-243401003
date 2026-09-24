/*
 * JAWABAN PERTANYAAN LATIHAN 5:
 * - Apa yang terjadi jika required dihapus:
 *   Dart akan menampilkan error: "The parameter 'nama' can't have a value of 'null' because its type is 'String'..."
 * - Alasan: Tipe String bersifat non-nullable (tidak boleh null). Karena parameter bernama bersifat opsional,
 *   jika tidak diberi `required` dan tidak ada nilai bawaan, Dart menganggap nilai awalnya null, yang melanggar Sound Null Safety.
 */

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