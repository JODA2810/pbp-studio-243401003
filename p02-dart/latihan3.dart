double rataRata(List<int> nilai) {
  if (nilai.isEmpty) {
    return 0.0;
  }
  int jumlah = 0;
  for (int n in nilai) {
    jumlah += n;
  }
  return jumlah / nilai.length;
}

void main() {
  print('Rata-rata: ${rataRata([80, 90, 75])}');
  print('Rata-rata daftar kosong: ${rataRata([])}');
}