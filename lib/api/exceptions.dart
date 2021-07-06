class ServerErrorException implements Exception {
  String message = "Сервер временно недоступен. Попробуйте позже";

  String getMessage() {
    return this.message;
  }

  @override
  String toString() {
    return this.message;
  }
}

class BadRequestException implements Exception {
  final String _message;

  BadRequestException(this._message);

  String getMessage() {
    return this._message;
  }

  @override
  String toString() {
    return this._message;
  }

  factory BadRequestException.fromJson(Map<String, dynamic> json) =>
      new BadRequestException(
          json.containsKey('message') ? json['message'] : json['error']);
}
