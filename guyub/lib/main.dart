import 'package:flutter/material.dart';

import 'Api.dart';

class ItemBacklog {
  const ItemBacklog({
    required this.kunci,
    required this.judul,
    required this.jenis,
    required this.poin,
    required this.status,
    this.penanggungJawab,
  });

  // A1: menghubungkan nama kunci JSON server dengan field Dart.
  factory ItemBacklog.fromJson(Map<String, dynamic> json) {
    return ItemBacklog(
      kunci: json['kode'],
      judul: json['judul'],
      jenis: json['jenis'],
      poin: json['poin'],
      status: json['status'],
      penanggungJawab: json['penanggung_jawab'],
    );
  }

  final String kunci;
  final String judul;
  final String jenis;
  final int poin;
  final String status;
  final String? penanggungJawab;
}

const urutanStatus = ['To Do', 'In Progress', 'Review', 'Done'];

void main() => runApp(const GuyubApp());

class GuyubApp extends StatelessWidget {
  const GuyubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Guyub', home: HalamanDaftar());
  }
}

// A2: layar menyimpan satu Future; FutureBuilder memilih tampilan.
class HalamanDaftar extends StatefulWidget {
  const HalamanDaftar({super.key});

  @override
  State<HalamanDaftar> createState() => _HalamanDaftarState();
}

class _HalamanDaftarState extends State<HalamanDaftar> {
  late Future<List<ItemBacklog>> muatan = ambilSemuaItem();

  // B1 + B2: dialog kartu baru, kirim ke server, tampilkan pesan.
  Future<void> bukaFormTambah() async {
    final kontrolJudul = TextEditingController();
    final kontrolPoin = TextEditingController();

    final simpan = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kartu baru'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: kontrolJudul,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: kontrolPoin,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Poin'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );

    if (simpan != true)
      return; // Batal atau dialog ditutup: tidak kirim apa pun.
    if (!mounted) return;

    final judul = kontrolJudul.text;
    // Teks bukan angka -> 0, supaya server yang menjawab 422.
    final poin = int.tryParse(kontrolPoin.text) ?? 0;

    String pesan;
    try {
      final kode = await tambahItem(judul, poin);
      if (kode == 201) {
        pesan = 'Kartu ditambahkan';
        if (!mounted) return;
        setState(() => muatan = ambilSemuaItem());
      } else if (kode == 422) {
        pesan = 'Judul wajib diisi dan poin paling kecil 1';
      } else {
        pesan = 'Server menjawab $kode';
      }
    } catch (e) {
      pesan = 'Server tidak bisa dihubungi';
    }

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guyub')),
      floatingActionButton: FloatingActionButton(
        onPressed: bukaFormTambah,
        tooltip: 'Tambah kartu',
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<ItemBacklog>>(
        future: muatan,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat: ${snapshot.error}'));
          }
          return DaftarKartu(items: snapshot.data!);
        },
      ),
    );
  }
}

class DaftarKartu extends StatelessWidget {
  const DaftarKartu({super.key, required this.items});

  final List<ItemBacklog> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final daftar = ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            final item = items[i];
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

        if (constraints.maxWidth >= 600 && items.isNotEmpty) {
          return Row(
            children: [
              Expanded(flex: 1, child: daftar),
              const VerticalDivider(width: 1),
              Expanded(
                flex: 2,
                child: DetailKartu(
                  key: ValueKey(items.first.kunci),
                  item: items.first,
                  tampilAppBar: false,
                ),
              ),
            ],
          );
        }
        return daftar;
      },
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
