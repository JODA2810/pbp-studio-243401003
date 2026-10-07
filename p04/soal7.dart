String? periksaNim(String nim, {int tahunSekarang = 2026}) {
  if (nim.length != 7) {
    return 'Panjang NIM harus tepat tujuh angka';
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(nim)) {
    return 'NIM mengandung karakter selain angka';
  }

  int? tahunMasuk = int.tryParse(nim.substring(0, 4));
  if (tahunMasuk == null || tahunMasuk < 2015 || tahunMasuk > tahunSekarang) {
    return 'Empat angka pertama bukan tahun masuk yang valid (harus 2015 - $tahunSekarang)';
  }

  return null; // NIM Sah
}

void main() {
  print('2024001 : ${periksaNim('2024001')}'); // Sah -> null
  print('202401  : ${periksaNim('202401')}');  // Salah panjang
  print('2024A01 : ${periksaNim('2024A01')}'); // Ada huruf
  print('2010001 : ${periksaNim('2010001')}'); // Tahun di luar jangkauan
}