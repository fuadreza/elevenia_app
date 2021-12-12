
import 'package:elevenia_app/feature/elevenia/data/services/database/table/products_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  Future<Database?> get database async {
    _database ??= await _initializeDb();

    return _database;
  }

  Future<Database> _initializeDb() async {
    final String path = await getDatabasesPath();
    final Future<Database> db = openDatabase(
      '$path/elevenia.db',
      onCreate: (Database db, int version) async {
        await db.execute(ProductsTable.create());
      },
      version: 1,
    );

    return db;
  }

  static close() async {
    await _database?.close();
  }
}
