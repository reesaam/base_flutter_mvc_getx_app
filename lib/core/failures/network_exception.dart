import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart' as dio;

import 'general_exception.dart';

@injectable
class NetworkException implements GeneralException {
  NetworkException({required this.message, this.statusCode});

  @override
  final String message;
  @override
  final int? statusCode;

  static NetworkException handleResponse(dio.Response? response) {
    switch (response?.statusCode) {
      case 203:
        throw NonAuthoritativeInformationException();

      case 204:
        throw NoContentException();

      case 304:
        throw NotModifiedException();

      /// to call refresh_token
      case 401:
        throw UnauthorizedException();

      case 402:
        throw PaymentRequiredException();

      case 403:
        throw ForbiddenException();

      case 404:
        throw NotFoundException();

      case 405:
        throw MethodNotAllowedException();

      case 406:
        throw NotAcceptableException();

      case 407:
        throw ProxyAuthRequiredException();

      case 408:
        throw RequestTimeoutException();

      case 409:
        throw ConflictException();

      case 411:
        throw LengthRequiredException();

      case 412:
        throw PreConditionFailedException();

      case 413:
        throw RequestEntityTooLargeException();

      case 414:
        throw RequestUriTooLongException();

      case 415:
        throw UnsupportedMediaTypeException();

      case 416:
        throw RequestedRangeNotSatisfiableException();

      case 417:
        throw ExpectationFailedException();

      case 422:
        throw UnProcessableEntityException();

      case 424:
        throw FailedDependencyException();

      case 425:
        throw UnorderedCollectionException();

      case 426:
        throw UpgradeRequiredException();

      case 429:
        throw TooManyRequestException();

      case 431:
        throw RequestHeaderFieldsTooLargeException();

      case 444:
        throw NoResponseException();

      case 451:
        throw UnavailableForLegalReasonsException();

      case 494:
        throw RequestHeaderTooLargeException();

      case 500:
        throw InternalServerErrorException();

      case 501:
        throw NotImplementedException();

      case 502:
        throw BadGatewayException();

      case 503:
        throw ServiceUnavailableException();

      case 504:
        throw GatewayTimeoutException();

      case 507:
        throw InsufficientStorageException();

      case 508:
        throw LoopDetectedException();

      case 509:
        throw BandwidthLimitException();

      case 510:
        throw NotExtendedException();

      case 511:
        throw NetworkAuthRequiredException();

      default:
        throw UnknownException();
    }
  }

  static ParsingDataException parsingDataException() => ParsingDataException();
}

class ParsingDataException extends NetworkException {
  ParsingDataException() : super(message: 'Parsing Data Exception');
}

// 203
class NonAuthoritativeInformationException extends NetworkException {
  NonAuthoritativeInformationException() : super(message: 'NonAuthoritative Information Exception', statusCode: 203);
}

// 204
class NoContentException extends NetworkException {
  NoContentException() : super(message: 'No Content Exception', statusCode: 204);
}

// 304
class NotModifiedException extends NetworkException {
  NotModifiedException() : super(message: 'Not Modified Exception', statusCode: 304);
}

// 400
class BadRequestException extends NetworkException {
  BadRequestException() : super(message: 'Bad Request Exception', statusCode: 400);
}

// 401
/// to call refresh_token
class UnauthorizedException extends NetworkException {
  UnauthorizedException() : super(message: 'Unauthorized Exception', statusCode: 401);
}

// 402
class PaymentRequiredException extends NetworkException {
  PaymentRequiredException() : super(message: 'Payment Required Exception', statusCode: 402);
}

// 403
class ForbiddenException extends NetworkException {
  ForbiddenException() : super(message: 'Forbidden Exception', statusCode: 403);
}

// 404
class NotFoundException extends NetworkException {
  NotFoundException() : super(message: 'Not Found Exception', statusCode: 404);
}

// 405
class MethodNotAllowedException extends NetworkException {
  MethodNotAllowedException() : super(message: 'Method Not Allowed Exception', statusCode: 405);
}

// 406
class NotAcceptableException extends NetworkException {
  NotAcceptableException() : super(message: 'Not Acceptable Exception', statusCode: 406);
}

// 407
class ProxyAuthRequiredException extends NetworkException {
  ProxyAuthRequiredException() : super(message: 'Proxy Auth Required Exception', statusCode: 407);
}

// 408
class RequestTimeoutException extends NetworkException {
  RequestTimeoutException() : super(message: 'Request Timeout Exception', statusCode: 408);
}

// 409
class ConflictException extends NetworkException {
  ConflictException() : super(message: 'Conflict Exception', statusCode: 409);
}

// 411
class LengthRequiredException extends NetworkException {
  LengthRequiredException() : super(message: 'Length Required Exception', statusCode: 411);
}

// 412
class PreConditionFailedException extends NetworkException {
  PreConditionFailedException() : super(message: 'PreCondition Failed Exception', statusCode: 412);
}

// 413
class RequestEntityTooLargeException extends NetworkException {
  RequestEntityTooLargeException() : super(message: 'Request Entity Too Large Exception', statusCode: 413);
}

// 414
class RequestUriTooLongException extends NetworkException {
  RequestUriTooLongException() : super(message: 'Request Uri Too Long Exception', statusCode: 414);
}

// 415
class UnsupportedMediaTypeException extends NetworkException {
  UnsupportedMediaTypeException() : super(message: 'Unsupported Media Type Exception', statusCode: 415);
}

// 416
class RequestedRangeNotSatisfiableException extends NetworkException {
  RequestedRangeNotSatisfiableException() : super(message: 'Requested Range Not Satisfiable Exception', statusCode: 416);
}

// 417
class ExpectationFailedException extends NetworkException {
  ExpectationFailedException() : super(message: 'Expectation FailedException', statusCode: 417);
}

// 422
class UnProcessableEntityException extends NetworkException {
  UnProcessableEntityException() : super(message: 'UnProcessable Entity Exception', statusCode: 422);
}

// 424
class FailedDependencyException extends NetworkException {
  FailedDependencyException() : super(message: 'Failed Dependency Exception', statusCode: 424);
}

// 425
class UnorderedCollectionException extends NetworkException {
  UnorderedCollectionException() : super(message: 'Unordered Collection Exception', statusCode: 425);
}

// 426
class UpgradeRequiredException extends NetworkException {
  UpgradeRequiredException() : super(message: 'Upgrade Required Exception', statusCode: 426);
}

// 429
class TooManyRequestException extends NetworkException {
  TooManyRequestException() : super(message: 'Too Many Request Exception', statusCode: 429);
}

// 431
class RequestHeaderFieldsTooLargeException extends NetworkException {
  RequestHeaderFieldsTooLargeException() : super(message: 'Request Header Fields Too Large Exception', statusCode: 431);
}

// 444
class NoResponseException extends NetworkException {
  NoResponseException() : super(message: 'No Response Exception', statusCode: 444);
}

// 451
class UnavailableForLegalReasonsException extends NetworkException {
  UnavailableForLegalReasonsException() : super(message: 'Unavailable For Legal Reasons Exception', statusCode: 451);
}

// 494
class RequestHeaderTooLargeException extends NetworkException {
  RequestHeaderTooLargeException() : super(message: 'Request Header Too Large Exception', statusCode: 494);
}

// 500
class InternalServerErrorException extends NetworkException {
  InternalServerErrorException() : super(message: 'Internal Server Error Exception', statusCode: 500);
}

// 501
class NotImplementedException extends NetworkException {
  NotImplementedException() : super(message: 'Not Implemented Exception', statusCode: 501);
}

// 502
class BadGatewayException extends NetworkException {
  BadGatewayException() : super(message: 'Bad Gateway Exception', statusCode: 502);
}

// 503
class ServiceUnavailableException extends NetworkException {
  ServiceUnavailableException() : super(message: 'Service Unavailable Exception', statusCode: 503);
}

// 504
class GatewayTimeoutException extends NetworkException {
  GatewayTimeoutException() : super(message: 'Gateway Timeout Exception', statusCode: 504);
}

// 507
class InsufficientStorageException extends NetworkException {
  InsufficientStorageException() : super(message: 'Insufficient Storage Exception', statusCode: 507);
}

// 508
class LoopDetectedException extends NetworkException {
  LoopDetectedException() : super(message: 'Loop Detected Exception', statusCode: 508);
}

// 509
class BandwidthLimitException extends NetworkException {
  BandwidthLimitException() : super(message: 'Bandwidth Limit Exception', statusCode: 509);
}

// 510
class NotExtendedException extends NetworkException {
  NotExtendedException() : super(message: 'Not Extended Exception', statusCode: 510);
}

// 511
class NetworkAuthRequiredException extends NetworkException {
  NetworkAuthRequiredException() : super(message: 'Network AuthRequired Exception', statusCode: 511);
}

class UnknownException extends NetworkException {
  UnknownException() : super(message: 'Unknown Network Error');
}
