class Weekdays {
  Weekdays({
    required this.name,
    required this.index,
    this.isSelected = false,
  });
  final String name;
  final int index;
  final bool isSelected;

  static List<Weekdays> weekdays = [
    Weekdays(name: 'Sun', index: DateTime.saturday),
    Weekdays(name: 'Mon', index: DateTime.monday),
    Weekdays(name: 'Tue', index: DateTime.tuesday),
    Weekdays(name: 'Wed', index: DateTime.wednesday),
    Weekdays(name: 'Thu', index: DateTime.thursday),
    Weekdays(name: 'Fri', index: DateTime.friday),
    Weekdays(name: 'Sat', index: DateTime.sunday),
  ];
}
