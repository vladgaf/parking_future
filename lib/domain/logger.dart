import 'package:flutter/foundation.dart';

class Logger {
  static Function(dynamic, [Object?, StackTrace?]) get log =>
      kDebugMode ? _logDebug : _logProd;

  static void _logDebug(dynamic message, [Object? data, StackTrace? stack]) {
    if (kDebugMode) print(message);
    if (stack != null) {
      debugPrintStack(stackTrace: stack, label: data.toString());
    }
  }

  static void _logProd(dynamic message, [Object? data, StackTrace? stack]) {
    String m = message.toString();
    if (data != null) m += ':\n$data';
    print(m);
  }
}
