import 'package:ems/src/core/services/navigation_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ServicesModule {
  @singleton
  NavigationService get navigationService => NavigationService();
}
