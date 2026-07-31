class Barang {
  final int? id;
  final String kode;
  final String nama;
  final String kategori;
  final String satuan;
  final int stok;

  Barang({
    this.id,
    required this.kode,
    required this.nama,
    required this.kategori,
    required this.satuan,
    required this.stok,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kode': kode,
      'nama': nama,
      'kategori': kategori,
      'satuan': satuan,
      'stok': stok,
    };
  }

  factory Barang.fromMap(Map<String, dynamic> map) {
    return Barang(
      id: map['id'],
      kode: map['kode'],
      nama: map['nama'],
      kategori: map['kategori'],
      satuan: map['satuan'],
      stok: map['stok'],
    );
  }
}
