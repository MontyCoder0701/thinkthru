import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/rule.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._();

  factory DatabaseService() => _databaseService;

  DatabaseService._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    return await _initialize();
  }

  Future<Database> _initialize() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'local.db');
    return await openDatabase(
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
    final db = await _databaseService.database;
    return await db.insert(
      'rule',
      rule.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Rule>> getManyRule() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('rule');
    return List.generate(maps.length, (index) => Rule.fromJson(maps[index]));
  }

  Future<void> updateOneRule(Rule rule) async {
    final db = await _databaseService.database;
    await db.update(
      'rule',
      rule.toJson(),
      where: 'id = ?',
      whereArgs: [rule.id],
    );
  }

  Future<void> deleteOneRule(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      'rule',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
