class ErrorException implements Exception{
  final _message, _prefix;
  ErrorException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends ErrorException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ErrorException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ErrorException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends ErrorException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class ConflictException extends ErrorException {
  ConflictException([String? message]) : super(message, "Conflict: ");
}

class NotFoundException extends ErrorException {
  NotFoundException([String? message]) : super(message, "Not Found: ");
}


class InternalServerErrorException extends ErrorException {
  InternalServerErrorException([String? message])
      : super(message, "Internal Server Error: ");
}


class ServiceUnavailableException extends ErrorException {
  ServiceUnavailableException([String? message])
      : super(message, "Service Unavailable: ");
}


class GatewayTimeoutException extends ErrorException {
  GatewayTimeoutException([String? message])
      : super(message, "Gateway Timeout: ");
}


class TooManyRequestsException extends ErrorException {
  TooManyRequestsException([String? message])
      : super(message, "Too Many Requests: ");
}


class NotImplementedException extends ErrorException {
  NotImplementedException([String? message])
      : super(message, "Not Implemented: ");
}

class BadGatewayException extends ErrorException {
  BadGatewayException([String? message]) : super(message, "Bad Gateway: ");
}


class ForbiddenException extends ErrorException {
  ForbiddenException([String? message]) : super(message, "Forbidden: ");
}


class PreconditionFailedException extends ErrorException {
  PreconditionFailedException([String? message])
      : super(message, "Precondition Failed: ");
}


class RequestTimeoutException extends ErrorException {
  RequestTimeoutException([String? message])
      : super(message, "Request Timeout: ");
}


class UnsupportedMediaTypeException extends ErrorException {
  UnsupportedMediaTypeException([String? message])
      : super(message, "Unsupported Media Type: ");
}


class UnprocessableEntityException extends ErrorException {
  UnprocessableEntityException([String? message])
      : super(message, "Unprocessable Entity: ");
}


class UpgradeRequiredException extends ErrorException {
  UpgradeRequiredException([String? message])
      : super(message, "Upgrade Required: ");
}


class UriTooLongException extends ErrorException {
  UriTooLongException([String? message]) : super(message, "URI Too Long: ");
}

class VariantAlsoNegotiatesException extends ErrorException {
  VariantAlsoNegotiatesException([String? message])
      : super(message, "Variant Also Negotiates: ");
}


class InsufficientStorageException extends ErrorException {
  InsufficientStorageException([String? message])
      : super(message, "Insufficient Storage: ");
}


class LoopDetectedException extends ErrorException {
  LoopDetectedException([String? message]) : super(message, "Loop Detected: ");
}


