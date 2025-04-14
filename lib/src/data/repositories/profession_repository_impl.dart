import 'package:sqflite/sqflite.dart';
import '../../core/errors/exceptions/exceptions.dart';
import '../datasources/profession_local_data_source.dart';
import '../models/profession/profession_model.dart';

class ProfessionLocalDataSourceImpl implements ProfessionLocalDataSource {
  final Database database;
  static const String tableName = 'professions';

  ProfessionLocalDataSourceImpl({required this.database});

  @override
  Future<List<ProfessionModel>> getAllProfessions() async {
    try {
      final List<Map<String, dynamic>> result = await database.query(tableName);

      return result.map((map) => ProfessionModel.fromJson(map)).toList();
    } catch (e) {
      throw CacheException('Failed to get professions: ${e.toString()}');
    }
  }

  @override
  Future<ProfessionModel> getProfessionById(String id) async {
    try {
      final List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (result.isEmpty) {
        throw CacheException('Profession with ID $id not found');
      }

      return ProfessionModel.fromJson(result.first);
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to get profession: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheProfessions(List<ProfessionModel> professions) async {
    try {
      // Start a transaction
      await database.transaction((txn) async {
        // Clear existing professions
        await txn.delete(tableName);

        // Insert all professions
        for (var profession in professions) {
          await txn.insert(
            tableName,
            profession.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
    } catch (e) {
      throw CacheException('Failed to cache professions: ${e.toString()}');
    }
  }

  @override
  Future<String> addProfession(ProfessionModel profession) async {
    try {
      final id = await database.insert(
        tableName,
        profession.toJson(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
      return id.toString();
    } catch (e) {
      throw CacheException('Failed to add profession: ${e.toString()}');
    }
  }

  @override
  Future<void> updateProfession(ProfessionModel profession) async {
    try {
      final count = await database.update(
        tableName,
        profession.toJson(),
        where: 'id = ?',
        whereArgs: [profession.id],
      );

      if (count == 0) {
        throw CacheException('Profession with ID ${profession.id} not found');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to update profession: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteProfession(String id) async {
    try {
      final count = await database.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (count == 0) {
        throw CacheException('Profession with ID $id not found');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to delete profession: ${e.toString()}');
    }
  }

  @override
  Future<List<ProfessionModel>> searchProfessions(String query) async {
    try {
      final List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'name LIKE ?',
        whereArgs: ['%$query%'],
      );

      return result.map((map) => ProfessionModel.fromJson(map)).toList();
    } catch (e) {
      throw CacheException('Error searching for professions: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteAllProfessions() async {
    try {
      await database.delete(tableName);
    } catch (e) {
      throw CacheException('Failed to delete all professions: ${e.toString()}');
    }
  }

  @override
  Future<int> getProfessionCount() async {
    try {
      final result = await database.rawQuery(
        'SELECT COUNT(*) as count FROM $tableName',
      );
      return Sqflite.firstIntValue(result) ?? 0;
    } catch (e) {
      throw CacheException('Failed to get profession count: ${e.toString()}');
    }
  }
}
