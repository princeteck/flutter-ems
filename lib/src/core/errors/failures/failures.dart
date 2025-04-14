import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure({required String message}) = _Failure;

  // Define specific failure types as factory constructors
  const factory Failure.server(String message) = ServerFailure;
  const factory Failure.cache(String message) = CacheFailure;
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.invalidInput(String message) = InvalidInputFailure;
  const factory Failure.notFound(String message) = NotFoundFailure;
  const factory Failure.unexpected(String message) = UnexpectedFailure;
  const factory Failure.validation(String message) = ValidationFailure;
  const factory Failure.unauthorized(String message) = UnauthorizedFailure;
}
