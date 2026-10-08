Future<List<String>> ambilBacklog() async {
  await Future.delayed(Duration(seconds: 2));
  return ['GYB-001 Halaman masuk', 'GYB-002 Tombol check-in'];
}

void main() async {
  print('Mengambil backlog dari server...');

  // 1. Tanpa await
  var tanpaAwait = ambilBacklog();
  print('Tanpa await: $tanpaAwait');

  // 2. Dengan await
  var denganAwait = await ambilBacklog();
  print('Dengan await: $denganAwait');
}