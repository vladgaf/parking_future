import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../pages/home/connection_provider.dart';
import '../../strings.dart';
import 'widgets/slot_card.dart';

class StatusFragment extends StatelessWidget {
  const StatusFragment({super.key});

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
