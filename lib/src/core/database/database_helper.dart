import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@Injectable()
class DatabaseHelper {
  final String _databaseName = 'ems.db';
  final int _databaseVersion = 1;

  @singleton
  @preResolve
  Future<Database> getDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE employees (
        id TEXT PRIMARY KEY,
        full_name TEXT NULLABLE,
        avatar TEXT NULLABLE,
        email TEXT NULLABLE,
        phone TEXT NULLABLE,
        profession JSON NULLABLE,
        joining_date TEXT NULLABLE,
        final_date TEXT NULLABLE,
        created_at TEXT NULLABLE,
        updated_at TEXT NULLABLE
      )
    ''');

    await db.execute('''
      CREATE TABLE professions (
        id TEXT PRIMARY KEY,
        name TEXT NULLABLE,
        created_at TEXT NULLABLE,
        updated_at TEXT NULLABLE
      )
    ''');

    await db.execute('''
      CREATE TABLE users (
        id TEXT PRIMARY KEY,
        username TEXT NULLABLE,
        avatar TEXT NULLABLE,
        email TEXT NULLABLE,
        password TEXT NULLABLE,
        created_at TEXT NULLABLE,
        updated_at TEXT NULLABLE
      )
    ''');
  }
}
