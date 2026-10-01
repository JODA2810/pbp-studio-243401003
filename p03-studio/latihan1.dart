class ItemBacklog {
  String kunci;
  String judul;
  int poin;
  String status = 'To Do';

  ItemBacklog(this.kunci, this.judul, this.poin);

  String ringkasan() {
    return '$kunci $judul ($poin poin) [$status]';
  }
}

void main() {
  var item1 = ItemBacklog('GYB-001', 'Halaman masuk', 3);
  var item2 = ItemBacklog('GYB-002', 'Tombol check-in', 5);

  print(item1.ringkasan());
  print(item2.ringkasan());

  item1.status = 'In Progress';
  print(item1.ringkasan());
}