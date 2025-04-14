// lib/data/datasources/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'employee_manager.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL,
      avatar TEXT,
      created_at TEXT NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE professions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL UNIQUE,
      description TEXT,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE employees (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      profession_id INTEGER NOT NULL,
      email TEXT,
      phone TEXT,
      hire_date TEXT NOT NULL,
      end_date TEXT,
      is_current INTEGER NOT NULL,
      notes TEXT,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL,
      FOREIGN KEY (profession_id) REFERENCES professions (id)
    )
    ''');
  }

  // User CRUD operations
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert(
      'users',
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUserByUsername(String username) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> getUserById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<int> updateUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.update(
      'users',
      user,
      where: 'id = ?',
      whereArgs: [user['id']],
    );
  }

  // Employee CRUD operations
  Future<int> insertEmployee(Map<String, dynamic> employee) async {
    final db = await database;
    return await db.insert('employees', employee);
  }

  Future<List<Map<String, dynamic>>> getEmployees() async {
    final db = await database;
    return await db.query('employees');
  }

  Future<List<Map<String, dynamic>>> getCurrentEmployees() async {
    final db = await database;
    return await db.query('employees', where: 'is_current = ?', whereArgs: [1]);
  }

  Future<List<Map<String, dynamic>>> getPastEmployees() async {
    final db = await database;
    return await db.query('employees', where: 'is_current = ?', whereArgs: [0]);
  }

  Future<Map<String, dynamic>?> getEmployeeById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'employees',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> searchEmployees(String query) async {
    final db = await database;
    String searchQuery = '%$query%';
    return await db.query(
      'employees',
      where: 'name LIKE ? OR email LIKE ? OR phone LIKE ?',
      whereArgs: [searchQuery, searchQuery, searchQuery],
    );
  }

  Future<int> updateEmployee(Map<String, dynamic> employee) async {
    final db = await database;
    return await db.update(
      'employees',
      employee,
      where: 'id = ?',
      whereArgs: [employee['id']],
    );
  }

  Future<int> deleteEmployee(int id) async {
    final db = await database;
    return await db.delete('employees', where: 'id = ?', whereArgs: [id]);
  }

  // Profession CRUD operations
  Future<int> insertProfession(Map<String, dynamic> profession) async {
    final db = await database;
    return await db.insert('professions', profession);
  }

  Future<List<Map<String, dynamic>>> getProfessions() async {
    final db = await database;
    return await db.query('professions');
  }

  Future<Map<String, dynamic>?> getProfessionById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'professions',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<int> updateProfession(Map<String, dynamic> profession) async {
    final db = await database;
    return await db.update(
      'professions',
      profession,
      where: 'id = ?',
      whereArgs: [profession['id']],
    );
  }

  Future<int> deleteProfession(int id) async {
    final db = await database;
    // Check if profession is used by any employee
    List<Map<String, dynamic>> result = await db.query(
      'employees',
      where: 'profession_id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isNotEmpty) {
      throw Exception('Cannot delete profession that is in use by employees');
    }
    return await db.delete('professions', where: 'id = ?', whereArgs: [id]);
  }
}
