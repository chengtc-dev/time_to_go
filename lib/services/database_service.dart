import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final onCreateSql = {
    'schedule':
        'CREATE TABLE Schedules(id INTEGER PRIMARY KEY, hour INTEGER, minute INTEGER, altitude REAL, longitude REAL)',
  };

  Future<Database> getDatabase(String dbName) async {
    return openDatabase(
      join(await getDatabasesPath(), '$dbName.db'),
      onCreate: (db, version) {
        return db.execute(onCreateSql[dbName]!);
      },
      version: 1,
    );
  }

  Future<void> insert(
      String dbName, String tableName, Map<String, Object?> data) async {
    final db = await getDatabase(dbName);
    await db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, Object?>>> query(
      String dbName, String tableName) async {
    final db = await getDatabase(dbName);
    return await db.query(tableName);
  }

  Future<void> update(String dbName, int id, String tableName,
      Map<String, Object?> data) async {
    final db = await getDatabase(dbName);
    await db.update(
      tableName,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> delete(String dbName, int id, String tableName) async {
    final db = await getDatabase(dbName);
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
