Map<String, double> hitungRataRata(Map<String, List<int>> data) {
  Map<String, double> hasil = {};
  data.forEach((nama, nilaiList) {
    if (nilaiList.isEmpty) {
      hasil[nama] = 0.0;
    } else {
      double total = nilaiList.reduce((a, b) => a + b).toDouble();
      hasil[nama] = total / nilaiList.length;
    }
  });
  return hasil;
}

String namaTertinggi(Map<String, List<int>> data) {
  Map<String, double> rerata = hitungRataRata(data);
  if (rerata.isEmpty) return 'Tidak ada data';

  String namaTerbaik = rerata.keys.first;
  double maxRerata = rerata[namaTerbaik] ?? 0.0;

  rerata.forEach((nama, nilai) {
    if (nilai > maxRerata) {
      maxRerata = nilai;
      namaTerbaik = nama;
    }
  });

  return namaTerbaik;
}

void main() {
  Map<String, List<int>> kelas = {
    'Alice': [80, 85, 90],
    'Bob': [70, 75, 80],
    'Charlie': [],
    'Diana': [95, 90, 100],
  };

  print('Rata-rata kelas: ${hitungRataRata(kelas)}');
  print('Mahasiswa Nilai Tertinggi: ${namaTertinggi(kelas)}');
}