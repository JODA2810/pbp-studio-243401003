double nilaiAkhir(double nts, double nas) {
  return nts * 0.4 + nas * 0.6;
}

// Batas Konversi Nilai:
// Nilai >= 85 : A
// Nilai >= 70 : B
// Nilai >= 55 : C
// Nilai >= 40 : D
// Nilai < 40  : E
String huruf(double nilai) {
  if (nilai >= 85) return 'A';
  if (nilai >= 70) return 'B';
  if (nilai >= 55) return 'C';
  if (nilai >= 40) return 'D';
  return 'E';
}

void main() {
  double uji1 = nilaiAkhir(90, 85); // 87.0 -> A
  double uji2 = nilaiAkhir(75, 65); // 69.0 -> C
  double uji3 = nilaiAkhir(30, 40); // 36.0 -> E

  print('Nilai Akhir 1: $uji1 (${huruf(uji1)})');
  print('Nilai Akhir 2: $uji2 (${huruf(uji2)})');
  print('Nilai Akhir 3: $uji3 (${huruf(uji3)})');
}