import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';
import '../../fragments/settings/provider.dart';
import '../../fragments/settings/settings.dart';
import '../../fragments/tuning/tuning.dart';
import '../../strings.dart';
import 'connection_provider.dart';
import 'pour_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late int index = 0;

  void setIndex(int index) {
    setState(() {
      this.index = index;
    });
  }

  static const bodies = [
    TuningFragment(),
    SettingsFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: index != 0,
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => get<SettingsProvider>()),
        ],
        child: bodies[index],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: setIndex,
        selectedIndex: index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.local_parking_rounded),
            label: Strings.status,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: Strings.settings,
          ),
        ],
      ),
    );
  }
}
