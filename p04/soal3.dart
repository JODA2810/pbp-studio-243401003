Map<String, double> hitungStatistik(List<int> numbers) {
  // Jika daftar kosong, kembalikan nilai 0.0 agar program tidak mengalami crash akibat pembagian nol atau ekstraksi indeks tak valid.
  if (numbers.isEmpty) {
    return {'tertinggi': 0.0, 'terendah': 0.0, 'rataRata': 0.0};
  }

  int maxVal = numbers[0];
  int minVal = numbers[0];
  int sum = 0;

  for (int num in numbers) {
    if (num > maxVal) maxVal = num;
    if (num < minVal) minVal = num;
    sum += num;
  }

  return {
    'tertinggi': maxVal.toDouble(),
    'terendah': minVal.toDouble(),
    'rataRata': sum / numbers.length,
  };
}

void main() {
  print('Daftar Terisi: ${hitungStatistik([10, 25, 50, 5, 80])}');
  print('Daftar Kosong: ${hitungStatistik([])}');
}