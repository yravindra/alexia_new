class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "[$_prefix]: $_message";
  }

  String get message => this._message;
}

class DataLayerException extends AppException {
  DataLayerException([String? message])
      : super(message, "Error During Communication: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised");
}

class ValidationException extends AppException {
  ValidationException([String? message]) : super(message, "Invalid Input");
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, "Not Found");
}

class InternalException extends AppException {
  InternalException([String? message]) : super(message, "Internal Error");
}

class InvalidJSONException extends AppException {
  InvalidJSONException([String? message]) : super(message, "Invalid JSON");
}
