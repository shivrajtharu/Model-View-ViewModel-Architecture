class AppException implements Exception{
  final _message;
  final _prifix;
  AppException([this._message, this._prifix]);

  String toString(){
    return '$_prifix$_message';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message, 'Error During Communication');

}

class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message, 'Invalid Request');

}

class UnauthorisedException extends AppException{
  UnauthorisedException([String? message]) : super(message, 'Unauthorised Request');

}

class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(message, 'Invalid Input');

}