import 'package:ems/src/domain/entities/employee/employee_entity.dart';
import 'package:ems/src/domain/entities/profession/profession_entity.dart';
import 'package:flutter/widgets.dart' show debugPrint;
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

abstract class EmployeeLocalDataSource {
  Future<List<EmployeeEntity>> getAllEmployees();

  Future<EmployeeEntity> getEmployeeById(String id);

  Future<void> cacheEmployees(List<EmployeeEntity> employees);

  Future<String> addEmployee(EmployeeEntity employee);

  Future<void> updateEmployee(EmployeeEntity employee);

  Future<void> deleteEmployee(String id);

  Future<void> deleteAllEmployees();

  Future<List<EmployeeEntity>> searchEmployees(String query);

  Future<List<EmployeeEntity>> getEmployeesByProfessionId(String professionId);
}

@Injectable(as: EmployeeLocalDataSource)
class EmployeeLocalDataSourceImpl implements EmployeeLocalDataSource {
  final Database database;

  EmployeeLocalDataSourceImpl(this.database);

  @override
  Future<String> addEmployee(EmployeeEntity employee) async {
    try {
      var employeeObj = employee.toJson();
      employeeObj['profession'] = employee.profession?.toJson().toString();
      final id = await database.insert('employees', employeeObj);
      return id.toString();
    } catch (e) {
      debugPrint('Failed to add employee: $e');
      throw Exception('Failed to add employee');
    }
  }

  @override
  Future<void> cacheEmployees(List<EmployeeEntity> employees) async {
    try {
      final batch = database.batch();
      for (var employee in employees) {
        batch.insert(
          'employees',
          employee.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    } catch (e) {
      debugPrint('Failed to cache employees: $e');
      throw Exception('Failed to cache employees');
    }
  }

  @override
  Future<void> deleteEmployee(String id) async {
    try {
      await database.delete('employees', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      debugPrint('Failed to delete employee: $e');
      throw Exception('Failed to delete employee');
    }
  }

  @override
  Future<List<EmployeeEntity>> getAllEmployees() async {
    try {
      final result = await database.query('employees');
      return result.map((json) {
        var dataObj = Map<String, dynamic>.from(json);
        if (json['profession'] != null && json['profession'] != '') {
          try {
            // The profession string is not valid JSON, it's a string representation of a Map
            // Extract ID and name using regex
            String profStr = json['profession'].toString();
            RegExp idRegex = RegExp(r'id:\s*([^,}]+)');
            RegExp nameRegex = RegExp(r'name:\s*([^,}]+)');

            var idMatch = idRegex.firstMatch(profStr);
            var nameMatch = nameRegex.firstMatch(profStr);

            if (idMatch != null && nameMatch != null) {
              String id = idMatch.group(1)!.trim();
              String name = nameMatch.group(1)!.trim();

              // Create a proper Map for the profession instead of an entity
              dataObj['profession'] = {'id': id, 'name': name};
            }
          } catch (e) {
            debugPrint('Error handling profession: $e');
          }
        }
        return EmployeeEntity.fromJson(dataObj);
      }).toList();
    } catch (e) {
      debugPrint('Failed to get all employees: $e');
      throw Exception('Failed to get all employees');
    }
  }

  @override
  Future<EmployeeEntity> getEmployeeById(String id) async {
    try {
      final result = await database.query(
        'employees',
        where: 'id = ?',
        whereArgs: [id],
      );
      if (result.isNotEmpty) {
        var dataObj = Map<String, dynamic>.from(result.first);
        if (dataObj['profession'] != null && dataObj['profession'] != '') {
          try {
            // Use regex to parse profession string
            String profStr = dataObj['profession'].toString();
            RegExp idRegex = RegExp(r'id:\s*([^,}]+)');
            RegExp nameRegex = RegExp(r'name:\s*([^,}]+)');

            var idMatch = idRegex.firstMatch(profStr);
            var nameMatch = nameRegex.firstMatch(profStr);

            if (idMatch != null && nameMatch != null) {
              String profId = idMatch.group(1)!.trim();
              String name = nameMatch.group(1)!.trim();

              dataObj['profession'] = {'id': profId, 'name': name};
            } else {
              dataObj['profession'] = null;
            }
          } catch (e) {
            debugPrint('Error parsing profession: $e');
            dataObj['profession'] = null;
          }
        }
        return EmployeeEntity.fromJson(dataObj);
      } else {
        throw Exception('Employee not found');
      }
    } catch (e) {
      debugPrint('Failed to get employee by ID: $e');
      throw Exception('Failed to get employee by ID');
    }
  }

  @override
  Future<List<EmployeeEntity>> getEmployeesByProfessionId(
    String professionId,
  ) async {
    try {
      final result = await database.query(
        'employees',
        where: 'professionId = ?',
        whereArgs: [professionId],
      );
      return result.map((json) {
        var dataObj = Map<String, dynamic>.from(json);
        if (dataObj['profession'] != null && dataObj['profession'] != '') {
          try {
            // Use regex to parse profession string
            String profStr = dataObj['profession'].toString();
            RegExp idRegex = RegExp(r'id:\s*([^,}]+)');
            RegExp nameRegex = RegExp(r'name:\s*([^,}]+)');

            var idMatch = idRegex.firstMatch(profStr);
            var nameMatch = nameRegex.firstMatch(profStr);

            if (idMatch != null && nameMatch != null) {
              String profId = idMatch.group(1)!.trim();
              String name = nameMatch.group(1)!.trim();

              dataObj['profession'] = {'id': profId, 'name': name};
            } else {
              dataObj['profession'] = null;
            }
          } catch (e) {
            debugPrint('Error parsing profession: $e');
            dataObj['profession'] = null;
          }
        }
        return EmployeeEntity.fromJson(dataObj);
      }).toList();
    } catch (e) {
      debugPrint('Failed to get employees by profession ID: $e');
      throw Exception('Failed to get employees by profession ID');
    }
  }

  @override
  Future<List<EmployeeEntity>> searchEmployees(String query) async {
    try {
      final result = await database.query(
        'employees',
        where: 'name LIKE ?',
        whereArgs: ['%$query%'],
      );
      return result.map((json) {
        var dataObj = Map<String, dynamic>.from(json);
        if (dataObj['profession'] != null && dataObj['profession'] != '') {
          try {
            // Use regex to parse profession string
            String profStr = dataObj['profession'].toString();
            RegExp idRegex = RegExp(r'id:\s*([^,}]+)');
            RegExp nameRegex = RegExp(r'name:\s*([^,}]+)');

            var idMatch = idRegex.firstMatch(profStr);
            var nameMatch = nameRegex.firstMatch(profStr);

            if (idMatch != null && nameMatch != null) {
              String profId = idMatch.group(1)!.trim();
              String name = nameMatch.group(1)!.trim();

              dataObj['profession'] = {'id': profId, 'name': name};
            } else {
              dataObj['profession'] = null;
            }
          } catch (e) {
            debugPrint('Error parsing profession: $e');
            dataObj['profession'] = null;
          }
        }
        return EmployeeEntity.fromJson(dataObj);
      }).toList();
    } catch (e) {
      debugPrint('Failed to search employees: $e');
      throw Exception('Failed to search employees');
    }
  }

  @override
  Future<void> updateEmployee(EmployeeEntity employee) async {
    try {
      var employeeObj = employee.toJson();
      employeeObj['profession'] = employee.profession?.asMap().toString();
      await database.update(
        'employees',
        employeeObj,
        where: 'id = ?',
        whereArgs: [employee.id],
      );
    } catch (e) {
      debugPrint('Failed to update employee: $e');
      throw Exception('Failed to update employee');
    }
  }

  @override
  Future<void> deleteAllEmployees() async {
    try {
      await database.delete('employees');
    } catch (e) {
      debugPrint('Failed to delete all employees: $e');
      throw Exception('Failed to delete all employees');
    }
  }
}
