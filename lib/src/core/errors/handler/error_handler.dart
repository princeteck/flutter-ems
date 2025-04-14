import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../../utils/toast_util.dart';
import '../exceptions/exceptions.dart';
import '../failures/failures.dart';

/// A helper class for handling errors and exceptions consistently
class ErrorHandler {
  final ToastUtil toastUtil;

  ErrorHandler({required this.toastUtil});

  /// Handles exceptions and converts them to failures
  Failure handleException(Exception exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    } else if (exception is CacheException) {
      return CacheFailure(exception.message);
    } else if (exception is InvalidInputException) {
      return InvalidInputFailure(exception.message);
    } else {
      return const ServerFailure('Unexpected error occurred');
    }
  }

  /// Shows an error message to the user
  void showErrorMessage(failure) {
    toastUtil.showErrorToast(failure.message);
  }

  /// Executes a function with proper error handling
  Future<Either<Failure, T>> execute<T>(Future<T> Function() function) async {
    try {
      final result = await function();
      return Right(result);
    } on Exception catch (e) {
      return Left(handleException(e));
    } catch (e) {
      return Left(const ServerFailure('Unexpected error occurred'));
    }
  }

  /// Wraps an isolate compute task with error handling
  Future<T> runIsolateTask<P, T>(
    ComputeCallback<P, T> callback,
    P param,
  ) async {
    try {
      return await compute(callback, param);
    } catch (e) {
      if (kDebugMode) {
        print('Error in isolate task: $e');
      }
      rethrow;
    }
  }
}
