class ServerException implements Exception {
  ServerException({required this.message});
  final String message;
}
