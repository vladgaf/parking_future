import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/slot.dart';
import '../../../widgets/basic_card.dart';

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
