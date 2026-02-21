import 'dart:convert';

class AppException implements Exception {
  final String message;
  final String prefix;
  final bool success;

  AppException({
    required this.message,
    this.prefix = '',
    this.success = false,
  });

  String get msg {
    final m = message.trim();
    if (m.isEmpty);
    return m;
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "prefix": prefix,
    "message": message,
    "msg": msg,
  };

  @override
  String toString() => msg;
}

class FetchDataException extends AppException {
  FetchDataException([String message = ''])
      : super(message: message, prefix: 'Error During communication');

  @override
  String toString() => jsonEncode(toJson());
}

class AppTimeoutException extends AppException {
  AppTimeoutException([String message = ''])
      : super(message: message, prefix: 'Timeout Error');

  @override
  String toString() => jsonEncode(toJson());
}

class BadRequestException extends AppException {
  BadRequestException([String message = ''])
      : super(message: message, prefix: 'Bad Request');
}

class UnAuthorException extends AppException {
  UnAuthorException([String message = ''])
      : super(message: message, prefix: 'Unauthorized');
}

class ConflictException extends AppException {
  ConflictException([String message = ''])
      : super(message: message, prefix: 'Conflict');
}

class UnIdentifyException extends AppException {
  UnIdentifyException([String message = ''])
      : super(message: message, prefix: 'Unknown');
}

class InvalidInputException extends AppException {
  InvalidInputException([String message = ''])
      : super(message: message, prefix: 'Invalid Input');
}
