String kartu({
  required String nama,
  required int nilai,
  String? catatan,
  bool tampilkanNilai = true,
}) {
  String bagianNilai = tampilkanNilai ? ' | Nilai: $nilai' : '';
  String bagianCatatan = catatan != null ? ' | Catatan: $catatan' : '';
  return '$nama$bagianNilai$bagianCatatan';
}

void main() {
  print(kartu(nama: 'Budi', nilai: 85, catatan: 'Tingkatkan', tampilkanNilai: true));
  print(kartu(nama: 'Siti', nilai: 90, tampilkanNilai: true));
  print(kartu(nama: 'Andi', nilai: 70, catatan: 'Izin Sakit', tampilkanNilai: false));
  print(kartu(nama: 'Dewi', nilai: 60, tampilkanNilai: false));
}