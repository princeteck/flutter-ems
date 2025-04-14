import 'package:dartz/dartz.dart';
import 'package:ems/src/data/models/employee/employee_model.dart';
import 'package:ems/src/domain/entities/profession/profession_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/exceptions/exceptions.dart';
import '../../../core/errors/failures/failures.dart';
import '../../../data/datasources/employee_local_data_source.dart';
import '../../entities/employee/employee_entity.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<EmployeeModel>>> getAllEmployees();

  Future<Either<Failure, EmployeeModel>> getEmployeeById(String id);

  Future<Either<Failure, void>> cacheEmployees(List<EmployeeEntity> employees);

  Future<Either<Failure, void>> addEmployee(EmployeeEntity employee);

  Future<Either<Failure, void>> updateEmployee(EmployeeEntity employee);

  Future<Either<Failure, void>> deleteEmployee(String id);
  Future<Either<Failure, void>> deleteAllEmployees();

  Future<Either<Failure, List<EmployeeEntity>>> searchEmployees(String query);

  Future<Either<Failure, List<EmployeeEntity>>> getEmployeesByProfessionId(
    String professionId,
  );
}

@Injectable(as: EmployeeRepository)
class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeLocalDataSource dataSource;

  EmployeeRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, EmployeeModel>> getEmployeeById(String id) async {
    try {
      final employee = await dataSource.getEmployeeById(id);
      var record = employee.toJson();
      record['profession'] = employee.profession?.toJson().toString();
      return Right(EmployeeModel.fromJson(employee.toJson()));
    } on ServerException {
      return Left(ServerFailure('Server error'));
    } on CacheException {
      return Left(CacheFailure('Cache error'));
    } on NotFoundException {
      return Left(NotFoundFailure('Employee not found'));
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<EmployeeEntity>>> searchEmployees(
    String query,
  ) async {
    try {
      final employees = await dataSource.searchEmployees(query);
      final employeeEntities =
          employees.map((e) => EmployeeEntity.fromJson(e.toJson())).toList();
      return Right(employeeEntities);
    } on ServerException {
      return Left(ServerFailure('Server error'));
    } on CacheException {
      return Left(CacheFailure('Cache error'));
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> addEmployee(EmployeeEntity employee) async {
    try {
      final id = await dataSource.addEmployee(employee);
      return Right(id);
    } on ServerException {
      return Left(ServerFailure('Server error'));
    } on ValidationException {
      return Left(ValidationFailure('Validation error'));
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateEmployee(EmployeeEntity employee) async {
    try {
      await dataSource.updateEmployee(employee);
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure('Server error'));
    } on NotFoundException {
      return Left(NotFoundFailure('Employee not found'));
    } on ValidationException {
      return Left(ValidationFailure('Validation error'));
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteEmployee(String id) async {
    try {
      await dataSource.deleteEmployee(id);
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure('Server error'));
    } on NotFoundException {
      return Left(NotFoundFailure('Employee not found'));
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheEmployees(
    List<EmployeeEntity> employees,
  ) async {
    try {
      await dataSource.cacheEmployees(employees);
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure('Failed to cache employees'));
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<EmployeeModel>>> getAllEmployees() async {
    try {
      final employees = await dataSource.getAllEmployees();
      var employeeModels =
          employees.map<EmployeeModel>((e) {
            var recordData = Map<String, dynamic>.from(e.toJson());
            recordData['profession'] = Map<String, dynamic>.from(
              e.profession!.asMap(),
            );
            // Create the EmployeeModel with cleaned data
            var employeeModel = EmployeeModel.fromJson(recordData);
            return employeeModel;
          }).toList();

      return Right(employeeModels);
    } on ServerException {
      return Left(ServerFailure('Server error'));
    } on CacheException {
      return Left(CacheFailure('Cache error'));
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<EmployeeEntity>>> getEmployeesByProfessionId(
    String professionId,
  ) async {
    try {
      final employees = await dataSource.getEmployeesByProfessionId(
        professionId,
      );
      final employeeEntities =
          employees.map((e) => EmployeeEntity.fromJson(e.toJson())).toList();
      return Right(employeeEntities);
    } on ServerException {
      return Left(ServerFailure('Server error'));
    } on CacheException {
      return Left(CacheFailure('Cache error'));
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllEmployees() async {
    try {
      await dataSource.deleteAllEmployees();
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure('Server error'));
    } on CacheException {
      return Left(CacheFailure('Failed to delete all employees'));
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error: $e'));
    }
  }
}
