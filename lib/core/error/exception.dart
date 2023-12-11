class AuthException implements Exception {
  final String error;

  AuthException(this.error);
}

class DataException implements Exception {
  final String error;

  DataException(this.error);
}
