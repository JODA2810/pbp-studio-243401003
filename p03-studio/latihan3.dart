class ItemBacklog {
  String kunci;
  String judul;

  ItemBacklog(this.kunci, this.judul);

  int prioritas() {
    return 2;
  }
}

class Story extends ItemBacklog {
  Story(super.kunci, super.judul);
}

class Bug extends ItemBacklog {
  Bug(super.kunci, super.judul);

  @override
  int prioritas() {
    return 1;
  }
}

void main() {
  List<ItemBacklog> daftarItem = [
    Story('GYB-003', 'Rekap kehadiran mingguan'),
    Bug('GYB-004', 'Check-in ganda saat sinyal hilang'),
  ];

  for (var item in daftarItem) {
    print('${item.kunci} ${item.judul}, prioritas ${item.prioritas()}');
  }
}