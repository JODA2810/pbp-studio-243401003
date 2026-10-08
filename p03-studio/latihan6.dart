Set<String> sudahHadir = {'Rina'};

Future<String> checkIn(String anggota, int jarakMeter) async {
  await Future.delayed(Duration(seconds: 1));
  
  if (sudahHadir.contains(anggota)) {
    throw Exception('$anggota sudah check-in hari ini');
  }
  
  if (jarakMeter > 100) {
    throw Exception('$anggota berada $jarakMeter m dari kantor, batasnya 100 m');
  }
  
  sudahHadir.add(anggota);
  return '$anggota berhasil check-in';
}

Future<void> coba(String anggota, int jarakMeter) async {
  try {
    var hasil = await checkIn(anggota, jarakMeter);
    print(hasil);
  } catch (e) {
    print('Gagal: $e');
  } finally {
    print('Selesai memeriksa $anggota');
  }
}

void main() async {
  // Tambahkan await pada setiap panggilan agar urutan cetakannya rapi
  await coba('Budi', 40);
  await coba('Rina', 20);
  await coba('Sari', 350);
}