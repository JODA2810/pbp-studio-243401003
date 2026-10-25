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
  ),
];

const urutanStatus = ['To Do', 'In Progress', 'Review', 'Done'];

void main() => runApp(const GuyubApp());

class GuyubApp extends StatelessWidget {
  const GuyubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Guyub', home: HalamanDaftar());
  }
}

class HalamanDaftar extends StatelessWidget {
  const HalamanDaftar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guyub')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final daftar = ListView.builder(
            itemCount: daftarKartu.length,
            itemBuilder: (context, i) {
              final item = daftarKartu[i];
              return ListTile(
                title: Text(item.judul),
                subtitle: Text(
                  '${item.kunci} · ${item.penanggungJawab ?? 'belum ada penanggung jawab'}',
                ),
                trailing: Text(item.status),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailKartu(item: item),
                  ),
                ),
              );
            },
          );

          if (constraints.maxWidth >= 600) {
            return Row(
              children: [
                Expanded(flex: 1, child: daftar),
                const VerticalDivider(width: 1),
                Expanded(
                  flex: 2,
                  child: DetailKartu(
                    item: daftarKartu.first,
                    tampilAppBar: false,
                  ),
                ),
              ],
            );
          }
          return daftar;
        },
      ),
    );
  }
}

class DetailKartu extends StatefulWidget {
  const DetailKartu({super.key, required this.item, this.tampilAppBar = true});

  final ItemBacklog item;
  final bool tampilAppBar;

  @override
  State<DetailKartu> createState() => _DetailKartuState();
}

class _DetailKartuState extends State<DetailKartu> {
  late String status = widget.item.status;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final i = urutanStatus.indexOf(status);
    final adaBerikut = i >= 0 && i < urutanStatus.length - 1;
    final bisaPindah = item.penanggungJawab != null && adaBerikut;
    final label = adaBerikut
        ? 'Pindah ke ${urutanStatus[i + 1]}'
        : 'Sudah Done';

    return Scaffold(
      appBar: widget.tampilAppBar ? AppBar(title: Text(item.kunci)) : null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.judul, style: Theme.of(context).textTheme.titleLarge),
            Text('${item.kunci} · ${item.jenis} · ${item.poin} poin'),
            Text(
              'Penanggung jawab: ${item.penanggungJawab ?? 'belum ada penanggung jawab'}',
            ),
            const SizedBox(height: 16),
            Text('Status: $status'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: bisaPindah
                  ? () => setState(() {
                      status = urutanStatus[i + 1];
                    })
                  : null,
              child: Text(label),
            ),
            if (item.penanggungJawab == null)
              const Text('Kartu tanpa penanggung jawab tidak bisa dipindah.'),
          ],
        ),
      ),
    );
  }
}
