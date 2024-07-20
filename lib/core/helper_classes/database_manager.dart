// ignore_for_file: unused_element
import 'dart:io';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  static Database? _db;

  static Future<Database> get db async => _db ??= await initDb();

  static Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'mind_database.db');

    // Check if the database exists
    final exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from assets
      ByteData data =
          await rootBundle.load(join("assets/database", "mind_database.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {}

    // open the database
    return await openDatabase(path, readOnly: false);
  }

  static _onUpgrade(Database db, int oldversion, int newversion) {
    // ignore: avoid_print
    print("onUpgrade =====================================");
  }

  // onConfigure to enable the foreign key.
  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  // Create tables when database called for first time
  static _onCreate(Database db, int version) async {
    // Create Categories Table
    await db.execute(''' CREATE TABLE Categories (
        cId INTEGER PRIMARY KEY,
        cName TEXT
      )''');

    // Create Questions Table
    await db.execute('''CREATE TABLE Questions ( 
        qId INTEGER PRIMARY KEY,
        categoryId INTEGER,
        difficulty TEXT,
        question TEXT,
        incorrectAnswers TEXT,
        correctAnswer TEXT,
        FOREIGN KEY (categoryId) REFERENCES Categories(cId)
      )''');

    // Create Users Table
    await db.execute('''CREATE TABLE Users (
        uId INTEGER PRIMARY KEY,
        uName TEXT,
        points INTEGER,
        ranking INTEGER
      )''');

    // ignore: avoid_print
    print(" onCreate =====================================");
  }

  // SELECT
  static Future<List<Map>> readDatabase(String sql,
      [List<Object?>? arguments]) async {
    Database? database = await db;
    List<Map> response = await database.rawQuery(sql, arguments);
    return response;
  }

  // DELETE
  static deleteDatabase(String sql, [List<Object?>? arguments]) async {
    Database? database = await db;
    int response = await database.rawDelete(sql, arguments);
    return response;
  }

  // UPDATE
  static updateDatabase(String sql, [List<Object?>? arguments]) async {
    Database? database = await db;
    int response = await database.rawUpdate(sql, arguments);
    return response;
  }

  // INSERT
  static insertDatabase(String sql, [List<Object?>? arguments]) async {
    Database? database = await db;
    int response = await database.rawInsert(sql, arguments);
    return response;
  }
}
