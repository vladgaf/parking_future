class Logger {
  static void log(dynamic message, [Object? data, StackTrace? stack]) {
    String m = message.toString();
    if (data != null) m += ':\n$data';
    // ignore: avoid_print
    print(m);
  }
}
