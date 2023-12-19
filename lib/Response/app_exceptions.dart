class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, '');
}

class UserNotFoudException extends AppExceptions {
  UserNotFoudException([String? message]) : super('', 'UserNotFound ');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? massage]) : super(massage, "");
}
