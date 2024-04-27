import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models.dart';

abstract class LocalRepository<T extends BaseModel> {
  static late final Database _instance;

  String get key => '';

  toJson() => throw UnimplementedError();

  fromJson(Map<String, dynamic> json) => throw UnimplementedError();

  static Future<void> initialize() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'local.db');
    _instance = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE rule(id INTEGER PRIMARY KEY, content TEXT, created_at DATETIME)',
        );
      },
    );
  }

  Future<int> createOne(T item) async {
    return await _instance.insert(
      key,
      toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<T>> getMany() async {
    final List<Map<String, dynamic>> maps = await _instance.query(key);
    return List.generate(maps.length, (index) => fromJson(maps[index]));
  }

  Future<void> updateOne(T item) async {
    await _instance.update(
      key,
      toJson(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> deleteOneRule(int id) async {
    await _instance.delete(
      key,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
