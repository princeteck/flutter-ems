// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sqflite/sqflite.dart' as _i779;

import '../../data/datasources/employee_local_data_source.dart' as _i619;
import '../../data/datasources/profession_local_data_source.dart' as _i506;
import '../../data/datasources/secure_storage.dart' as _i267;
import '../../data/datasources/user_local_data_source.dart' as _i723;
import '../../domain/repositories/employee/employee_repository.dart' as _i1015;
import '../../domain/repositories/profession/profession_repository.dart'
    as _i758;
import '../../domain/repositories/user/user_repository.dart' as _i528;
import '../../presentation/bloc/dashboard/dashboard_cubit.dart' as _i185;
import '../../presentation/bloc/employee/employee_cubit.dart' as _i177;
import '../../presentation/bloc/profession/profession_cubit.dart' as _i850;
import '../../presentation/bloc/system/system_cubit.dart' as _i1071;
import '../compute/isolate_manager.dart' as _i412;
import '../database/database_helper.dart' as _i64;
import '../database/database_module.dart' as _i215;
import '../services/navigation_service.dart' as _i31;
import '../services/services_module.dart' as _i553;
import '../storage/secure_storage.dart' as _i619;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final servicesModule = _$ServicesModule();
  final secureStorageModule = _$SecureStorageModule();
  final databaseModule = _$DatabaseModule();
  gh.factory<_i64.DatabaseHelper>(() => _i64.DatabaseHelper());
  gh.singleton<_i412.IsolateManager>(() => _i412.IsolateManager());
  gh.singleton<_i31.NavigationService>(() => servicesModule.navigationService);
  gh.singleton<_i185.DashboardCubit>(() => _i185.DashboardCubit());
  gh.singleton<_i1071.SystemCubit>(() => _i1071.SystemCubit());
  gh.lazySingleton<_i558.FlutterSecureStorage>(
    () => secureStorageModule.flutterSecureStorage,
  );
  gh.lazySingleton<_i177.EmployeeCubit>(() => _i177.EmployeeCubit());
  gh.factory<_i267.SecureStorage>(
    () => _i267.SecureStorageImpl(gh<_i558.FlutterSecureStorage>()),
  );
  gh.factory<_i723.UserLocalDataSource>(() => _i723.UserLocalDataSourceImpl());
  gh.factory<_i528.UserRepository>(
    () => _i528.UserRepositoryImpl(dataSource: gh<_i723.UserLocalDataSource>()),
  );
  await gh.singletonAsync<_i779.Database>(
    () => databaseModule.provideDatabase(gh<_i64.DatabaseHelper>()),
    preResolve: true,
  );
  gh.factory<_i619.EmployeeLocalDataSource>(
    () => _i619.EmployeeLocalDataSourceImpl(gh<_i779.Database>()),
  );
  gh.singleton<_i619.SecureStorage>(
    () => _i619.SecureStorage(gh<_i558.FlutterSecureStorage>()),
  );
  gh.factory<_i1015.EmployeeRepository>(
    () => _i1015.EmployeeRepositoryImpl(
      dataSource: gh<_i619.EmployeeLocalDataSource>(),
    ),
  );
  gh.factory<_i506.ProfessionLocalDataSource>(
    () => _i506.ProfessionLocalDataSourceImpl(gh<_i779.Database>()),
  );
  gh.factory<_i758.ProfessionRepository>(
    () => _i758.ProfessionRepositoryImpl(
      dataSource: gh<_i506.ProfessionLocalDataSource>(),
    ),
  );
  gh.singleton<_i850.ProfessionCubit>(
    () => _i850.ProfessionCubit(gh<_i758.ProfessionRepository>()),
  );
  return getIt;
}

class _$ServicesModule extends _i553.ServicesModule {}

class _$SecureStorageModule extends _i619.SecureStorageModule {}

class _$DatabaseModule extends _i215.DatabaseModule {}
