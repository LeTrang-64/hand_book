
abstract class Exception {
  //using factory
  factory Exception([var message]) => _Exception(message);
}

/// Default implementation of [Exception] which carries a message.
class _Exception implements Exception {
  final dynamic message;

  _Exception([this.message]);

  String toString() {
    Object? message = this.message;
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}