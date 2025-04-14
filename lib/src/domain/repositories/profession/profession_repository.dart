import 'package:dartz/dartz.dart';
import 'package:ems/src/domain/entities/profession/profession_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures/failures.dart';
import '../../../data/datasources/profession_local_data_source.dart';
import '../../../data/models/profession/profession_model.dart';

abstract class ProfessionRepository {
  Future<Either<Failure, List<ProfessionEntity>>> getProfessions();
  Future<Either<Failure, int>> getProfessionCount();
  Future<Either<Failure, ProfessionEntity>> getProfessionById(String id);
  Future<Either<Failure, List<ProfessionEntity>>> searchProfessions(
    String query,
  );
  Future<Either<Failure, String>> addProfession(ProfessionEntity profession);
  Future<Either<Failure, void>> updateProfession(ProfessionEntity profession);
  Future<Either<Failure, void>> deleteProfession(String id);
  Future<Either<Failure, void>> deleteAllProfessions();
}

@Injectable(as: ProfessionRepository)
class ProfessionRepositoryImpl implements ProfessionRepository {
  final ProfessionLocalDataSource dataSource;

  ProfessionRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, String>> addProfession(
    ProfessionEntity profession,
  ) async {
    try {
      var professionModel = ProfessionModel.fromJson(profession.toJson());
      final id = await dataSource.addProfession(professionModel);
      return Right(id);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfession(String id) async {
    try {
      await dataSource.deleteProfession(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfessionEntity>> getProfessionById(String id) async {
    try {
      final professionModel = await dataSource.getProfessionById(id);
      final professionEntity = ProfessionEntity.fromJson(
        professionModel.toJson(),
      );
      return Right(professionEntity);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProfessionEntity>>> getProfessions() async {
    try {
      final professions = await dataSource.getAllProfessions();
      final professionEntities =
          professions
              .map(
                (professionModel) =>
                    ProfessionEntity.fromJson(professionModel.toJson()),
              )
              .toList();
      return Right(professionEntities);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProfessionEntity>>> searchProfessions(
    String query,
  ) async {
    try {
      final professions = await dataSource.searchProfessions(query);
      final professionEntities =
          professions
              .map(
                (professionModel) =>
                    ProfessionEntity.fromJson(professionModel.toJson()),
              )
              .toList();
      return Right(professionEntities);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfession(
    ProfessionEntity profession,
  ) async {
    try {
      var professionModel = ProfessionModel.fromJson(profession.toJson());
      await dataSource.updateProfession(professionModel);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllProfessions() async {
    try {
      await dataSource.deleteAllProfessions();
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getProfessionCount() async {
    try {
      final count = await dataSource.getProfessionCount();
      return Right(count);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
