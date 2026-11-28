import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'nama_saya.dart';
import 'papan_model.dart';

const urutanStatus = ['To Do', 'In Progress', 'Review', 'Done'];

class DetailKartu extends StatelessWidget {
  const DetailKartu({super.key, required this.item});

  final ItemBacklog item;

  // Kirim ke server lewat model. Bila gagal, tampilkan pesannya dan kembalikan false.
  Future<bool> simpan(BuildContext context, String status) async {
    final pesan = await context.read<PapanModel>().ubahStatus(
      item.kode,
      status,
    );
    if (pesan != null && context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(pesan)));
    }
    return pesan == null;
  }

  // Pegang kartu atas nama pemakai. Nama dibaca dari perangkat.
  Future<void> sayaKerjakan(BuildContext context) async {
    final nama = await bacaNama();
    if (!context.mounted) return;
    if (nama == null || nama.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Isi nama Anda dulu lewat tombol orang di papan'),
        ),
      );
      return;
    }

    final pesan = await context.read<PapanModel>().pegangKartu(item.kode, nama);
    if (!context.mounted) return;
    if (pesan != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(pesan)));
      return;
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('${item.judul} dipegang $nama')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    context.watch<PapanModel>();
    final posisi = urutanStatus.indexOf(item.status);
    final berikutnya = posisi >= 0 && posisi < urutanStatus.length - 1
        ? urutanStatus[posisi + 1]
        : null;

    return Scaffold(
      appBar: AppBar(title: Text(item.judul)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text('Kode: ${item.kode}'),
            Text('Poin: ${item.poin}'),
            Text('Penanggung jawab: ${item.penanggungJawab ?? 'belum ada'}'),
            Text('Status: ${item.status}'),
            if (berikutnya != null)
              FilledButton(
                onPressed: () => simpan(context, berikutnya),
                child: Text('Pindah ke $berikutnya'),
              ),
            OutlinedButton(
              onPressed: () async {
                if (await simpan(context, 'Done') && context.mounted) {
                  Navigator.pop(context, true);
                }
              },
              child: const Text('Selesai'),
            ),
            OutlinedButton(
              onPressed: () => sayaKerjakan(context),
              child: const Text('Saya kerjakan'),
            ),
          ],
        ),
      ),
    );
  }
}
