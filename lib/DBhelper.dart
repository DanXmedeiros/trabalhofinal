import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  static Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'events.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE events(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        descricao TEXT,
        data TEXT
      )
    ''');
  }

  static Future<int> insertEvent(Map<String, dynamic> event) async {
    final db = await database;
    return await db!.insert('eventos', event);
  }

  static Future<List<Map<String, dynamic>>> getEvents() async {
    final db = await database;
    return await db!.query('eventos');
  }

  static Future<int> updateEvent(Map<String, dynamic> event) async {
    final db = await database;
    return await db!.update(
      'eventos',
      event,
      where: 'id = ?',
      whereArgs: [event['id']],
    );
  }

  static Future<int> deleteEvent(int id) async {
    final db = await database;
    return await db!.delete(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
