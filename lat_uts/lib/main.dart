import 'package:flutter/material.dart';

class Produk {
  final String nama;
  final int harga;
  const Produk(this.nama, this.harga);
}

const daftarProduk = [
  Produk('Kopi', 15000),
  Produk('Teh', 8000),
  Produk('Roti', 12000),
  Produk('Susu', 10000),
  Produk('Cokelat', 18000),
];

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: HalamanUtama()),
  );
}

// TODO A4: halaman utama responsif (LayoutBuilder, Row, Expanded).

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toko Kecil')),
      body: ListView.builder(
        itemCount: daftarProduk.length,
        itemBuilder: (context, index) {
          final produk = daftarProduk[index];
          return ListTile(
            title: Text(produk.nama),
            subtitle: Text('Harga: ${produk.harga}'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(produk: produk),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Produk produk;
  const DetailPage({super.key, required this.produk});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(produk.nama)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(produk.nama, style: const TextStyle(fontSize: 24)),
            Text('Rp ${produk.harga}'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class Jumlah extends StatefulWidget {
  const Jumlah({super.key});

  @override
  State<Jumlah> createState() => _JumlahState();
}

class _JumlahState extends State<Jumlah> {
  int _jumlah = 0;

  void _increment() {
    setState(() {
      _jumlah++;
    });
  }

  void _decrement() {
    setState(() {
      if (_jumlah > 0) {
        _jumlah--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: const Icon(Icons.remove), onPressed: _decrement),
        Text('$_jumlah', style: const TextStyle(fontSize: 20)),
        IconButton(icon: const Icon(Icons.add), onPressed: _increment),
      ],
    );
  }
}

// TODO A3: widget Jumlah (StatefulWidget, tombol - dan +).
