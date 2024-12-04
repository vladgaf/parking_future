import 'package:equatable/equatable.dart';

class UiSlot extends Equatable {
  final String name;
  final bool taken;

  const UiSlot({
    required this.name,
    required this.taken,
  });

  @override
  List<Object?> get props => [name, taken];
}

List<UiSlot> parseSlots(String input) {
  Map<String, bool> slotMap = {};
  RegExp slotRegex = RegExp(r's\d+=\d');
  Iterable<Match> matches = slotRegex.allMatches(input);

  for (Match match in matches) {
    String slotString = match.group(0)!;
    List<String> parts = slotString.split('=');
    if (parts.length == 2) {
      String name = parts[0];
      bool taken = parts[1] == '1';
      slotMap[name] = taken;
    }
  }

  List<UiSlot> slots = [];
  for (int i = 1; i <= 5; i++) {
    String slotName = 's$i';
    bool taken = slotMap[slotName] ?? false;
    slots.add(UiSlot(name: slotName, taken: taken));
  }

  return slots;
}
