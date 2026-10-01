class Kehadiran {
  final String anggota;
  final int jamMasuk;
  final int menitMasuk;

  Kehadiran({required this.anggota, required this.jamMasuk, required this.menitMasuk});

  Kehadiran.dariJson(Map<String, dynamic> json)
      : anggota = json['anggota'],
        jamMasuk = json['jam'],
        menitMasuk = json['menit'];

  bool get terlambat {
    int totalMenitMasuk = (jamMasuk * 60) + menitMasuk;
    int batasMenit = (8 * 60) + 15;
    return totalMenitMasuk > batasMenit;
  }
}

void main() {
  var kehadiranRina = Kehadiran(anggota: 'Rina', jamMasuk: 8, menitMasuk: 10);
  
  var dataServer = {'anggota': 'Budi', 'jam': 8, 'menit': 40};
  var kehadiranBudi = Kehadiran.dariJson(dataServer);

  print('${kehadiranRina.anggota} terlambat? ${kehadiranRina.terlambat}');
  print('${kehadiranBudi.anggota} terlambat? ${kehadiranBudi.terlambat}');
}