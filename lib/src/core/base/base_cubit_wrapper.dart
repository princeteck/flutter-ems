import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:get_it/get_it.dart';

import '../di/di.dart';

abstract class BaseCubitWrapper<T> extends Cubit<T> {
  BaseCubitWrapper(super.state);
  GetIt get injector => sl;

  void showLog(dynamic message) {
    debugPrint('[$runtimeType] $message');
  }
}
