abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AppException(this.message, [this.stackTrace]);

  @override
  String toString() {
    return stackTrace != null
        ? '$runtimeType: $message\n$stackTrace'
        : '$runtimeType: $message';
  }
}
