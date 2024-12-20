import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../presentation/fragments/settings/provider.dart';

class ParamKey {
  static const autoConnect = 'autoConnect';

  static const typesMap = {
    autoConnect: bool,
  };
}

class Param extends Equatable {
  final Type? type;
  final String key;
  final String title;
  final String description;
  final dynamic value;
  final dynamic maxValue;
  final Function action;

  const Param._({
    required this.type,
    required this.key,
    required this.title,
    required this.description,
    required this.value,
    required this.maxValue,
    required this.action,
  });

  /// Параметр приложения, сохраняемый в телефоне
  factory Param.stored({
    required SettingsProvider provider,
    required String key,
    required String title,
    String? description,
    required dynamic defaultValue,
    dynamic maxValue,
    ValueChanged<dynamic>? onChanged,
  }) {
    return Param._(
      type: ParamKey.typesMap[key],
      key: key,
      title: title,
      description: description ?? '',
      value: provider.getParam(key, defaultValue),
      maxValue: maxValue,
      action: (v) {
        provider.setParam(key, v);
        onChanged?.call(v);
      },
    );
  }

  @override
  List<Object?> get props => [
        key,
        title,
        description,
        value,
        action,
      ];
}
