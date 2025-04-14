import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

/// Service locator for the app
final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => init(sl);

// Make sure to call this in your app initialization
Future<void> setupDependencies() async {
  configureDependencies();
}
