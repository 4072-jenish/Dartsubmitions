void main() {
  print('Leap years between 2020 and 2080:');

  for (int year = 2020; year <= 2080; year++) {
    if (isLeapYear(year)) {
      print(year);
    }
  }
}

bool isLeapYear(int year) {
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
