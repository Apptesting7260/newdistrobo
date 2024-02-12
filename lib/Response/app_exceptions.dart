class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No internet');
}

class UserNotFoudException extends AppExceptions {
  UserNotFoudException([String? message]) : super('', 'UserNotFound ');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? massage]) : super(massage, "");
}

class Notavailableforpurchase extends AppExceptions {
  Notavailableforpurchase([String? massage]) : super(massage, "");
}
class RequestTimeOut extends AppExceptions {

  RequestTimeOut([String? message]) : super(message, 'Request Time out') ;

}

class ServerException extends AppExceptions {

  ServerException([String? message]) : super(message, 'Internal server error') ;

}

class InvalidUrlException extends AppExceptions {

  InvalidUrlException([String? message]) : super(message, 'Invalid Url') ;

}

class FetchDataException extends AppExceptions {

  FetchDataException([dynamic? message]) : super(message, '') ;

}

// new exceptions ************************




class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? massage])
      : super(massage, "Unauthorised Request");
}
