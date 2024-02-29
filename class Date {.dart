class Date {
  int day;
  int month;
  int year;

  Date(this.day, this.month, this.year);

  bool isLeapYear() {
    if (year % 4 != 0) {
      return false;
    } else if (year % 100 != 0) {
      return true;
    } else if (year % 400 != 0) {
      return false;
    } else {
      return true;
    }
  }

  int get daysInMonth {
    if (month == 2) {
      return isLeapYear() ? 29 : 28;
    } else if ([4, 6, 9, 11].contains(month)) {
      return 30;
    } else {
      return 31;
    }
  }

  bool isValid() {
    if (day < 1 || day > daysInMonth) {
      return false;
    } else if (month < 1 || month > 12) {
      return false;
    } else {
      return true;
    }
  }

  @override
  String toString() {
    return 'Date(day: $day, month: $month, year: $year)';
  }
}