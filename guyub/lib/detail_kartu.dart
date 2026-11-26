import 'package:flutter/material.dart';

import 'main.dart';
import 'papan_model.dart';

import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    context.watch<PapanModel>();
    // A4: baris context.watch ditulis di sini.
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
          ],
        ),
      ),
    );
  }
}
