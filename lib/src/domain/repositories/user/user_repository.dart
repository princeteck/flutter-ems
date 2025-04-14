import 'package:dartz/dartz.dart';
import 'package:ems/src/domain/entities/user/user_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../core/errors/failures/failures.dart';
import '../../../data/datasources/user_local_data_source.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> login(String username, String password);
  Future<Either<Failure, UserEntity>> register(
    String username,
    String password,
    String? avatar,
  );
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> updateUserAvatar(String userId, String avatar);
}

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource dataSource;

  UserRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = await dataSource.getCurrentUser();
      final userEntity =
          user != null ? UserEntity.fromJson(user.toJson()) : null;
      return Right(userEntity);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
    String username,
    String password,
  ) async {
    try {
      final user = await dataSource.login(username, password);
      final userEntity = UserEntity.fromJson(user.toJson());
      return Right(userEntity);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(
    String username,
    String password,
    String? avatar,
  ) async {
    try {
      final user = await dataSource.register(username, password, avatar);
      final userEntity = UserEntity.fromJson(user.toJson());
      return Right(userEntity);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserAvatar(
    String userId,
    String avatar,
  ) async {
    try {
      await dataSource.updateUserAvatar(userId, avatar);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
