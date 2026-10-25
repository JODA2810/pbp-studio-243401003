import 'package:flutter/material.dart';

class ItemBacklog {
  const ItemBacklog({
    required this.kunci,
    required this.judul,
    required this.jenis,
    required this.poin,
    required this.status,
    this.penanggungJawab,
  });

  final String kunci;
  final String judul;
  final String jenis;
  final int poin;
  final String status;
  final String? penanggungJawab;
}

const List<ItemBacklog> daftarKartu = [
  ItemBacklog(
    kunci: 'GYB-001',
    judul: 'Halaman menu roti',
    jenis: 'story',
    poin: 5,
    status: 'Done',
    penanggungJawab: 'Sekar',
  ),
  ItemBacklog(
    kunci: 'GYB-002',
    judul: 'Form pesanan',
    jenis: 'story',
    poin: 5,
    status: 'Review',
    penanggungJawab: 'Bayu',
  ),
  ItemBacklog(
    kunci: 'GYB-003',
    judul: 'Tombol pesan tidak aktif di Safari',
    jenis: 'bug',
    poin: 2,
    status: 'In Progress',
    penanggungJawab: 'Dimas',
  ),
  ItemBacklog(
    kunci: 'GYB-004',
    judul: 'Ongkir dihitung per kecamatan',
    jenis: 'story',
    poin: 3,
    status: 'To Do',
    penanggungJawab: 'Bayu',
  ),
  ItemBacklog(
    kunci: 'GYB-005',
    judul: 'Foto produk lambat dimuat',
    jenis: 'bug',
    poin: 2,
    status: 'To Do',
    penanggungJawab: 'Sekar',
  ),
];

void main() => runApp(const GuyubApp());

class GuyubApp extends StatelessWidget {
  const GuyubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Guyub',
      home: Scaffold(body: Center(child: Text('Guyub'))),
    );
  }
}
