extension ExceptionExtension on Exception {
  String get formattedMessage {
    if (toString().startsWith('Exception: ')) {
      return toString().substring(11);
    } else {
      return toString();
    }
  }
}
