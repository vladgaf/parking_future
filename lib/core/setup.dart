import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../domain/model/device.dart';
import '../domain/storage/settings.dart';
import '../injection.dart';

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  initServices();
}

Future<void> initHive() async {
  Hive.registerAdapter(UiDeviceAdapter());
  await Hive.initFlutter();
  await Hive.openBox(SettingsBox.name);
}
