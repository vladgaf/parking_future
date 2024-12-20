import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../domain/model/param.dart';
import 'basic_card.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget? right;
  final VoidCallback? onTap;

  const SettingsCard._({
    required this.title,
    required this.description,
    this.right,
    this.onTap,
  });

  factory SettingsCard.fromParam(Param param) {
    switch (param.type) {
      case bool:
        return SettingsCard._(
          title: param.title,
          description: param.description,
          onTap: () => param.action(!param.value),
          right: Checkbox(
            value: param.value as bool,
            onChanged: (v) => param.action(v),
          ),
        );
      case null:
        return SettingsCard._(
          title: param.title,
          description: param.description,
          right: const Icon(Icons.settings_suggest_rounded),
          onTap: () => param.action(),
        );
      default:
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      onTap: onTap,
      padding: AppTheme.padding,
      color: AppTheme.background,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                if (description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTheme.additional,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (right != null)
            SizedBox.square(
              dimension: 40,
              child: Center(
                child: right!,
              ),
            ),
        ],
      ),
    );
  }
}
