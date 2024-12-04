import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../../domain/model/slot.dart';
import '../../pages/home/connection_provider.dart';
import '../../strings.dart';
import '../../widgets/basic_card.dart';
import 'provider.dart';

export 'provider.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final tuning = context.watch<TuningProvider>();
    final connection = context.watch<ConnectionProvider>();
    final cocktail = tuning.cocktail;
    connection.setCocktail(cocktail);

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

class ParkingSlotCard extends StatelessWidget {
  final UiSlot slot;

  const ParkingSlotCard({super.key, required this.slot});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: BasicCard(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        color: !slot.taken ? AppTheme.accent.withOpacity(0.7) : AppTheme.accent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Парковочное место ${slot.name}',
              style: AppTheme.pageTitle,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Статус',
                    style: AppTheme.text,
                  ),
                ),
                Text(
                  !slot.taken ? 'Занято' : 'Свободно',
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: !slot.taken ? Colors.red : Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
