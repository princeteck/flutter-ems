import 'package:sqflite/sqflite.dart';

import '../../core/errors/exceptions/exceptions.dart';
import '../../domain/entities/employee/employee_entity.dart';
import '../datasources/employee_local_data_source.dart';

class EmployeeLocalDataSourceImpl implements EmployeeLocalDataSource {
  final Database database;
  static const String tableName = 'employees';

  EmployeeLocalDataSourceImpl({required this.database});

  @override
  Future<List<EmployeeEntity>> getAllEmployees() async {
    try {
      final List<Map<String, dynamic>> result = await database.query(tableName);
      return result.map((map) => EmployeeEntity.fromJson(map)).toList();
    } catch (e) {
      throw CacheException('Failed to get employees: ${e.toString()}');
    }
  }

  @override
  Future<EmployeeEntity> getEmployeeById(String id) async {
    try {
      final List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (result.isEmpty) {
        throw CacheException('Employee with ID $id not found');
      }

      return EmployeeEntity.fromJson(result.first);
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to get employee: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheEmployees(List<EmployeeEntity> employees) async {
    try {
      await database.transaction((txn) async {
        // Clear existing employees
        await txn.delete(tableName);

        // Insert all employees
        for (var employee in employees) {
          await txn.insert(
            tableName,
            employee.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
    } catch (e) {
      throw CacheException('Failed to cache employees: ${e.toString()}');
    }
  }

  @override
  Future<String> addEmployee(EmployeeEntity employee) async {
    try {
      final id = await database.insert(
        tableName,
        employee.toJson(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
      return id.toString();
    } catch (e) {
      throw CacheException('Failed to add employee: ${e.toString()}');
    }
  }

  @override
  Future<void> updateEmployee(EmployeeEntity employee) async {
    try {
      final count = await database.update(
        tableName,
        employee.toJson(),
        where: 'id = ?',
        whereArgs: [employee.id],
      );

      if (count == 0) {
        throw CacheException('Employee with ID ${employee.id} not found');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to update employee: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteEmployee(String id) async {
    try {
      final count = await database.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (count == 0) {
        throw CacheException('Employee with ID $id not found');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to delete employee: ${e.toString()}');
    }
  }

  @override
  Future<List<EmployeeEntity>> searchEmployees(String query) async {
    try {
      final List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'name LIKE ? OR email LIKE ?',
        whereArgs: ['%$query%', '%$query%'],
      );

      return result.map((map) => EmployeeEntity.fromJson(map)).toList();
    } catch (e) {
      throw CacheException('Error searching for employees: ${e.toString()}');
    }
  }

  @override
  Future<List<EmployeeEntity>> getEmployeesByProfessionId(
    String professionId,
  ) async {
    try {
      final List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'profession_id = ?',
        whereArgs: [professionId],
      );

      return result.map((map) => EmployeeEntity.fromJson(map)).toList();
    } catch (e) {
      throw CacheException(
        'Failed to get employees by profession: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> deleteAllEmployees() async {
    try {
      await database.delete(tableName);
    } catch (e) {
      throw CacheException('Failed to delete all employees: ${e.toString()}');
    }
  }

  @override
  Future<int> getEmployeeCount() async {
    try {
      final result = await database.rawQuery(
        'SELECT COUNT(*) as count FROM $tableName',
      );
      return Sqflite.firstIntValue(result) ?? 0;
    } catch (e) {
      throw CacheException('Failed to get employee count: ${e.toString()}');
    }
  }
}
