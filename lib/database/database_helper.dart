import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('winfit_stock.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE barang(
id INTEGER PRIMARY KEY AUTOINCREMENT,
kode TEXT NOT NULL,
nama TEXT NOT NULL,
kategori TEXT NOT NULL,
satuan TEXT NOT NULL,
stok INTEGER NOT NULL
)
''');
  }

  Future<int> insertBarang(Map<String, dynamic> row) async {
  final db = await instance.database;
  return await db.insert('barang', row);
}

Future<List<Map<String, dynamic>>> getAllBarang() async {
  final db = await instance.database;
  return await db.query('barang');
}

Future<int> updateBarang(Map<String, dynamic> row) async {
  final db = await instance.database;

  return await db.update(
    'barang',
    row,
    where: 'id = ?',
    whereArgs: [row['id']],
  );
}

Future<int> deleteBarang(int id) async {
  final db = await instance.database;

  return await db.delete(
    'barang',
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future close() async {
  final db = await instance.database;
  db.close();
}

}
