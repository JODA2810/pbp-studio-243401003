Map<String, int> bagiTagihan(int total, List<String> peserta, Map<String, int> diskonPersen) {
  if (peserta.isEmpty || total <= 0) return {};

  Map<String, int> bobot = {};
  int totalBobot = 0;

  for (String p in peserta) {
    int diskon = diskonPersen[p] ?? 0;
    int b = 100 - diskon;
    bobot[p] = b;
    totalBobot += b;
  }

  if (totalBobot == 0) return {};

  Map<String, int> hasil = {};
  int totalTerkumpul = 0;

  for (String p in peserta) {
    int bayar = (total * bobot[p]!) ~/ totalBobot;
    hasil[p] = bayar;
    totalTerkumpul += bayar;
  }

  int sisa = total - totalTerkumpul;
  if (sisa > 0) {
    hasil[peserta.first] = (hasil[peserta.first] ?? 0) + sisa;
  }

  return hasil;
}

void main() {
  int totalTagihan = 100000;
  List<String> peserta = ['Alice', 'Bob', 'Charlie'];
  Map<String, int> diskon = {'Alice': 10, 'Bob': 20};

  Map<String, int> rincian = bagiTagihan(totalTagihan, peserta, diskon);
  int totalBayaran = rincian.values.fold(0, (sum, val) => sum + val);

  print('Rincian Pembayaran: $rincian');
  print('Jumlah seluruh bayaran : $totalBayaran');
  print('Total tagihan asli     : $totalTagihan');
  print('Apakah jumlah persis utuh? ${totalBayaran == totalTagihan}');
}