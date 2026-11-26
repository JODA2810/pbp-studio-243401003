import 'package:flutter/foundation.dart';

import 'api.dart';
import 'main.dart';

typedef AmbilItem = Future<List<ItemBacklog>> Function();
typedef KirimStatus = Future<int> Function(String kode, String status);

// Data papan disimpan di sini supaya bisa dipakai beberapa layar.
class PapanModel extends ChangeNotifier {
  PapanModel({this.ambil = ambilSemuaItem, this.kirim = ubahStatusDiServer});

  final AmbilItem ambil;
  final KirimStatus kirim;

  List<ItemBacklog> _items = [];
  bool _sedangMuat = false;
  String? _pesanError;

  List<ItemBacklog> get items => _items;
  bool get sedangMuat => _sedangMuat;
  String? get pesanError => _pesanError;

  Future<void> muat() async {
    _sedangMuat = true;
    _pesanError = null;
    notifyListeners();
    try {
      _items = await ambil();
    } catch (e) {
      _pesanError = 'Server tidak bisa dihubungi';
    }
    _sedangMuat = false;
    notifyListeners();
  }

  // Server dulu, baru layar. Hasilnya pesan error, atau null bila berhasil.
  Future<String?> ubahStatus(String kode, String statusBaru) async {
    try {
      final kodeJawaban = await kirim(kode, statusBaru);
      if (kodeJawaban != 200) return 'Gagal menyimpan ke server ($kodeJawaban)';
    } catch (e) {
      return 'Server tidak bisa dihubungi';
    }
    final item = _items.firstWhere((item) => item.kode == kode);
    item.status = statusBaru;
    notifyListeners();
    return null;
  }
}
