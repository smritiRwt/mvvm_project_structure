class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "$_message$_prefix";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
    : super(message, "Error During Communication");
}

class BadRequestsException extends AppExceptions {
  BadRequestsException([String? message])
    : super(message, "Bad Request Exception");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
    : super(message, "Unauthorized Exception");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
    : super(message, "Invalid Input Exception");
}
