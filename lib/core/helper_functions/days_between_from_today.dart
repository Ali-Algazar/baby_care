int daysBetweenFromToday(DateTime targetDate) {
  final today = DateTime.now();

  final from = DateTime(today.year, today.month, today.day);
  final to = DateTime(targetDate.year, targetDate.month, targetDate.day);

  return to.difference(from).inDays;
}
