import 'package:shared_preferences/shared_preferences.dart';

// Nama pemakai disimpan di perangkat, jadi tetap ada setelah aplikasi ditutup.
const kunciNama = 'nama_saya';

Future<String?> bacaNama() async {
  final simpanan = await SharedPreferences.getInstance();
  return simpanan.getString(kunciNama);
}

Future<void> simpanNama(String nama) async {
  final simpanan = await SharedPreferences.getInstance();
  await simpanan.setString(kunciNama, nama);
}
