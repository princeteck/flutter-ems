import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../models/profession/profession_model.dart';

abstract class ProfessionLocalDataSource {
  Future<List<ProfessionModel>> getAllProfessions();

  Future<ProfessionModel> getProfessionById(String id);

  Future<void> cacheProfessions(List<ProfessionModel> professions);

  Future<String> addProfession(ProfessionModel profession);

  Future<void> updateProfession(ProfessionModel profession);

  Future<void> deleteProfession(String id);

  Future<void> deleteAllProfessions();

  Future<List<ProfessionModel>> searchProfessions(String query);
}

@Injectable(as: ProfessionLocalDataSource)
class ProfessionLocalDataSourceImpl implements ProfessionLocalDataSource {
  final Database database;

  ProfessionLocalDataSourceImpl(this.database);

  @override
  Future<String> addProfession(ProfessionModel profession) async {
    final id = await database.insert(
      'professions',
      profession.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id.toString();
  }

  @override
  Future<void> cacheProfessions(List<ProfessionModel> professions) async {
    final batch = database.batch();
    for (var profession in professions) {
      batch.insert(
        'professions',
        profession.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  @override
  Future<void> deleteProfession(String id) async {
    await database.delete('professions', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<ProfessionModel>> getAllProfessions() async {
    final result = await database.query('professions');
    return result.map((json) => ProfessionModel.fromJson(json)).toList();
  }

  @override
  Future<ProfessionModel> getProfessionById(String id) async {
    final result = await database.query(
      'professions',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return ProfessionModel.fromJson(result.first);
    } else {
      throw Exception('Profession not found');
    }
  }

  @override
  Future<List<ProfessionModel>> searchProfessions(String query) async {
    final result = await database.query(
      'professions',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
    return result.map((json) => ProfessionModel.fromJson(json)).toList();
  }

  @override
  Future<void> updateProfession(ProfessionModel profession) async {
    await database.update(
      'professions',
      profession.toJson(),
      where: 'id = ?',
      whereArgs: [profession.id],
    );
  }

  @override
  Future<void> deleteAllProfessions() {
    return database.delete('professions');
  }
}
