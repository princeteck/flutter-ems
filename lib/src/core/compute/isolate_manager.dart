import 'package:flutter/foundation.dart' as flutter;
import 'package:injectable/injectable.dart';

/// A service that manages computation on background isolates
@module
class IsolateManager {
  /// Runs a computation in a separate isolate.
  ///
  /// [callback] is the function to execute in the background
  /// [param] is the parameter to pass to the callback function
  ///
  /// Returns the result of the computation
  Future<R> compute<P, R>(
    flutter.ComputeCallback<P, R> callback,
    P param,
  ) async {
    try {
      return await flutter.compute(callback, param);
    } catch (e) {
      flutter.debugPrint('Error executing task in isolate: $e');
      rethrow;
    }
  }
}
