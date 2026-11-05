import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(const MaterialApp(home: LayarDaftar()));

// Tulis semua kode Anda di berkas ini. Kerjakan langkah U1 sampai U6 di SOAL-UTS-PBP.pdf.
// Kode yang belum jalan jadikan komentar (Cmd + / atau Ctrl + /) supaya aplikasi tetap berjalan.

// Layar daftar. Sudah StatefulWidget, karena di U5 kos yang terpilih disimpan di sini.
class LayarDaftar extends StatefulWidget {
  const LayarDaftar({super.key});

  @override
  State<LayarDaftar> createState() => _LayarDaftarState();
}

class _LayarDaftarState extends State<LayarDaftar> {
  // U5: kos yang tampil di kanan pada layar lebar.
  Kos dipilih = daftarKos.first;

  // Contoh U2, membuka layar baru (hapus tanda // bila dipakai):
  void _bukaDetail(Kos kos) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(kos.nama)),
          body: DetailKos(kos: kos),
        ),
      ),
    );
  }

  // U1: daftar kos. Parameter `lebar` dikirim dari LayoutBuilder (U5).
  Widget _buatDaftar(bool lebar) {
    return ListView.builder(
      itemCount: daftarKos.length,
      itemBuilder: (context, i) {
        final kos = daftarKos[i];
        return ListTile(
          selected: lebar && kos.kode == dipilih.kode,
          title: Text(
            kos.nama,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('${kos.jenis} · ${kos.hargaTeks}'),
          trailing: Text(kos.penuh ? 'Penuh' : '${kos.kamarKosong} kosong'),
          onTap: () {
            if (lebar) {
              setState(
                () => dipilih = kos,
              ); // layar lebar: ganti detail di kanan
            } else {
              _bukaDetail(kos); // HP: pindah layar
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kos Sekitar Kampus')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final lebar = constraints.maxWidth >= 600;
          if (!lebar) {
            return _buatDaftar(false);
          }
          return Row(
            children: [
              SizedBox(width: 320, child: _buatDaftar(true)),
              Expanded(
                child: DetailKos(
                  key: ValueKey(dipilih.kode), // ganti kos -> State baru
                  kos: dipilih,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// U3 dan U4. Isi layar detail, tanpa Scaffold. Sudah StatefulWidget, karena tombol survei berubah.
class DetailKos extends StatefulWidget {
  const DetailKos({super.key, required this.kos});

  final Kos kos;

  @override
  State<DetailKos> createState() => _DetailKosState();
}

class _DetailKosState extends State<DetailKos> {
  // U4: status tombol survei.
  bool disurvei = false;

  @override
  Widget build(BuildContext context) {
    final kos = widget.kos;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(kos.nama, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('${kos.kode} · ${kos.jenis}'),
          const SizedBox(height: 8),
          Text(kos.alamat),
          const SizedBox(height: 8),
          Text(kos.hargaTeks),
          const SizedBox(height: 8),
          Text(kos.penuh ? 'Kamar penuh' : 'Kamar kosong: ${kos.kamarKosong}'),
          const SizedBox(height: 8),
          const Text('Fasilitas:'),
          for (final fasilitas in kos.fasilitas) Text('- $fasilitas'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: kos.penuh
                ? null
                : () {
                    setState(() {
                      disurvei = !disurvei;
                    });
                  },
            child: Text(disurvei ? 'Sudah disurvei' : 'Tandai sudah disurvei'),
          ),
        ],
      ),
    );
  }
}
