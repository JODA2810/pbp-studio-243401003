mixin BisaDilacak {
  String buatKunci(String proyek, int nomor) {
    return '$proyek-${nomor.toString().padLeft(3, '0')}';
  }
}

class ItemBacklog with BisaDilacak {
  int nomor;
  String judul;

  ItemBacklog(this.nomor, this.judul);

  String get kunci => buatKunci('GYB', nomor);
}

void main() {
  var item = ItemBacklog(7, 'Widget sisa poin sprint');
  print('${item.kunci} ${item.judul}');
}