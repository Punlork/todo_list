class RestBadRequestException implements Exception {
  final String message;

  RestBadRequestException({required this.message});
}
