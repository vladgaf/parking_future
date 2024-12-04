part of 'settings.dart';

class _Params {
  final BuildContext context;
  late final List<Param> list;

  _Params(this.context) {
    final settings = context.watch<SettingsProvider>();

    list = [
      Param.stored(
        provider: settings,
        key: ParamKey.autoConnect,
        title: Strings.autoConnectTitle,
        description: Strings.autoConnectDescription,
        defaultValue: true,
      ),
    ];

    const typesMap = ParamKey.typesMap;
    assert(list.length == typesMap.keys.length);
  }
}
