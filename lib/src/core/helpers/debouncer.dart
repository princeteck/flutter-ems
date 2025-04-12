import 'dart:async';
import 'package:flutter/foundation.dart';

class Debouncer {
  /// The duration to wait before executing the callback function
  final Duration delay;

  /// Optional identifier for debugging
  final String? id;

  /// Internal timer that tracks the delay
  Timer? _timer;

  /// Creates a new Debouncer instance.
  ///
  /// [delay] specifies how long to wait after the last call before executing the callback.
  /// [id] is an optional identifier that can be useful for debugging purposes.
  Debouncer({this.delay = const Duration(milliseconds: 500), this.id});

  /// Run the provided callback after the specified delay.
  /// If this method is called again before the delay has elapsed,
  /// the previous callback will be cancelled, and the timer will be reset.
  void run(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);

    if (kDebugMode && id != null) {
      debugPrint(
        'Debouncer[$id]: Started with ${delay.inMilliseconds}ms delay',
      );
    }
  }

  /// Runs the callback with parameters after the specified delay.
  /// This is useful when you need to pass data to the debounced function.
  void runWithParam<T>(void Function(T param) callback, T param) {
    _timer?.cancel();
    _timer = Timer(delay, () => callback(param));

    if (kDebugMode && id != null) {
      debugPrint(
        'Debouncer[$id]: Started with param and ${delay.inMilliseconds}ms delay',
      );
    }
  }

  /// Immediately executes the pending callback, if any, and cancels the timer.
  void flush(VoidCallback? callback) {
    _timer?.cancel();
    callback?.call();

    if (kDebugMode && id != null) {
      debugPrint('Debouncer[$id]: Flushed');
    }
  }

  /// Cancels any pending callbacks without executing them.
  void cancel() {
    _timer?.cancel();

    if (kDebugMode && id != null) {
      debugPrint('Debouncer[$id]: Cancelled');
    }
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;

    if (kDebugMode && id != null) {
      debugPrint('Debouncer[$id]: Disposed');
    }
  }
}
