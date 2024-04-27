import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models.dart';

abstract class LocalRepository<T> {
  static late final Database _instance;

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

  Future<int> createOneRule(Rule rule) async {
    final db = await _instance.database;
    return await db.insert(
      'rule',
      rule.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Rule>> getManyRule() async {
    final List<Map<String, dynamic>> maps = await _instance.query('rule');
    return List.generate(maps.length, (index) => Rule.fromJson(maps[index]));
  }

  Future<void> updateOneRule(Rule rule) async {
    await _instance.update(
      'rule',
      rule.toJson(),
      where: 'id = ?',
      whereArgs: [rule.id],
    );
  }

  Future<void> deleteOneRule(int id) async {
    await _instance.delete(
      'rule',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
