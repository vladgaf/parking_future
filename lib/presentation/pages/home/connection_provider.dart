import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/connection/connector.dart';
import '../../../domain/connection/device_methods.dart';
import '../../../domain/model/device.dart';
import '../../../domain/model/slot.dart';

@injectable
class ConnectionProvider extends ChangeNotifier {
  final DeviceMethods _methods;
  final Connector _connector;

  ConnectionProvider(this._methods, this._connector) {
    device = _connector.device;
    _infoSub?.cancel();
    _infoSub = _methods.infoStream.listen(_infoListener);
  }

  UiDevice? device;
  List<UiSlot> output = [];
  StreamSubscription? _infoSub;

  // * Init

  void _infoListener(String output) {
    this.output = parseSlots(output);
    notifyListeners();
  }

  // * Helpers

  Future<void> disconnect() {
    device = null;
    notifyListeners();
    return _connector.disconnect();
  }

  @override
  void dispose() {
    _infoSub?.cancel();
    return super.dispose();
  }
}
