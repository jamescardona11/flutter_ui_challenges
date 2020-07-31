import 'dart:core';

int daysInMonth() {
  final now = DateTime.now();
  final firstDayThisMonth = DateTime(now.year, now.month, now.day);
  final firstDayNextMonth = DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}

String dayName(int day) {
  //Fake
  int finalDay = day;

  if (day > 7) {
    final delta = (day / 7).floor();
    finalDay = finalDay - delta * 7;
    if (finalDay == 0) finalDay = 7;
  }

  switch (finalDay) {
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thu';
    case 5:
      return 'Fry';
    case 6:
      return 'Sat';
    case 7:
      return 'Sun';
  }

  return 'Mon';
}
