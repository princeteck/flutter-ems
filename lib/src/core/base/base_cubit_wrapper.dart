import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:get_it/get_it.dart';

abstract class BaseCubitWrapper<T> extends Cubit<T> {
  BaseCubitWrapper(super.state);

  // Access the GetIt instance directly to avoid any issues
  GetIt get injector => GetIt.instance;

  void showLog(dynamic message) {
    debugPrint('[$runtimeType] $message');
  }
}
