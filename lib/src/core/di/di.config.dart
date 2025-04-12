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

import '../../presentation/bloc/dashboard/dashboard_cubit.dart' as _i185;
import '../../presentation/bloc/employee/employee_cubit.dart' as _i177;
import '../../presentation/bloc/profession/profession_cubit.dart' as _i850;
import '../../presentation/bloc/system/system_cubit.dart' as _i1071;
import '../services/navigation_service.dart' as _i31;
import '../services/services_module.dart' as _i553;
import '../storage/secure_storage.dart' as _i619;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final servicesModule = _$ServicesModule();
  final secureStorageModule = _$SecureStorageModule();
  gh.singleton<_i185.DashboardCubit>(() => _i185.DashboardCubit());
  gh.singleton<_i1071.SystemCubit>(() => _i1071.SystemCubit());
  gh.singleton<_i31.NavigationService>(() => servicesModule.navigationService);
  gh.singleton<_i850.ProfessionCubit>(() => _i850.ProfessionCubit());
  gh.singleton<_i177.EmployeeCubit>(() => _i177.EmployeeCubit());
  gh.lazySingleton<_i558.FlutterSecureStorage>(
    () => secureStorageModule.flutterSecureStorage,
  );
  gh.singleton<_i619.SecureStorage>(
    () => _i619.SecureStorage(gh<_i558.FlutterSecureStorage>()),
  );
  return getIt;
}

class _$ServicesModule extends _i553.ServicesModule {}

class _$SecureStorageModule extends _i619.SecureStorageModule {}
