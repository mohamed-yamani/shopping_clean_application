class UnauthorizedException implements Exception{
  final message = 'Unauthorized';

  @override
  String toString() {
    return message;
  }
}