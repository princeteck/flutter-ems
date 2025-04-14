class CacheException implements Exception {
  final String message;

  CacheException(this.message);

  @override
  String toString() => 'CacheException: $message';
}

/// Base exception class for server-related errors
class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => 'ServerException: $message';
}

/// Exception for database-related errors
class DatabaseException extends CacheException {
  DatabaseException(super.message);

  @override
  String toString() => 'DatabaseException: $message';
}

/// Exception for invalid input errors
class InvalidInputException implements Exception {
  final String message;

  InvalidInputException(this.message);

  @override
  String toString() => 'InvalidInputException: $message';
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);

  @override
  String toString() => 'NotFoundException: $message';
}

class ValidationException implements Exception {
  final String message;

  ValidationException([this.message = '']);
}
