import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../injection.dart';
import '../presentation/pages/home/connection_provider.dart';
import '../presentation/pages/home/home.dart';
import '../presentation/pages/launch/launch.dart';
import '../presentation/pages/scan/scan.dart';

final _homeKey = GlobalKey<HomePageState>();

class AppRoutes {
  static const launch = '/launch';
  static const scan = '/scan';
  static const home = '/home';

  static const status = '/home/status';
  static const settings = '/home/settings';

  static void setHomeIndex(int index) {
    _homeKey.currentState?.setIndex(index);
  }

  static Route? openPage(RouteSettings settings) {
    final _path = settings.name ?? home;
    final _mainRoute = '/' + _path.split('/')[1];

    switch (_mainRoute) {
      case launch:
        return _makeRoute(
          BlocProvider(
            create: (_) => get<LaunchCubit>(),
            child: const LaunchPage(),
          ),
        );
      case scan:
        return _makeRoute(
          BlocProvider(
            create: (_) => get<ScanCubit>(),
            child: const ScanPage(),
          ),
        );
      case home:
        return _makeRoute(ChangeNotifierProvider(
          create: (_) => get<ConnectionProvider>(),
          child: _getHomePage(_path),
        ));
    }

    return null;
  }

  static Route _makeRoute(Widget child) {
    // return CupertinoPageRoute(builder: (_) => child);
    return MaterialPageRoute(builder: (_) => child);
  }

  static Widget _getHomePage(String path) {
    String subPath = path.replaceAll(home, '');
    if (subPath.isEmpty) subPath = status.replaceAll(home, '');

    final route = _homeSubRoutes.firstWhere((r) => r.contains(subPath));
    final index = _homeSubRoutes.indexOf(route);
    setHomeIndex(index);
    return HomePage(key: _homeKey);
  }

  static List<String> get _homeSubRoutes => [
        status,
        settings,
      ];
}
