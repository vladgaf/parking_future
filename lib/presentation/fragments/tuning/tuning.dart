import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../pages/home/connection_provider.dart';
import '../../strings.dart';
import 'widgets/tuning_card.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final connection = context.watch<ConnectionProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.autoBartender,
          style: AppTheme.pageTitle,
        ),
      ),
      body: ListView(
        children: [
          ...connection.output.map((e) => ParkingSlotCard(slot: e)),
        ],
      ),
    );
  }
}
