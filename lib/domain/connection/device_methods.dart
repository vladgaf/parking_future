import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../data/connection/fbs_adapter.dart';

abstract interface class DeviceMethods {
  Stream<String> get infoStream;
}

@Injectable(as: DeviceMethods)
class FbsDeviceMethods implements DeviceMethods {
  final FbsAdapter _adapter;

  FbsDeviceMethods(this._adapter);

  @override
  Stream<String> get infoStream {
    return _adapter.input.distinct(listEquals).map((u) => utf8.decode(u));
  }
}
