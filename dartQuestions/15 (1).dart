class Calendar {
  Map<DateTime, List<String>> events = {};
  Map<String, TimeOfDay> reminders = {};
  Calendar({required this.events, required this.reminders});
  void addEvent(DateTime date, String eventText) {
    if (!events.containsKey(date)) {
      events[date] = [eventText];
      print('Event added on $date: $eventText');
    } else {
      events[date]!.add(eventText);
      print('Event added on $date: $eventText');
    }
  }
  void setReminder(String eventText, TimeOfDay reminderTime) {
    if (events.containsValue(eventText)) {
      reminders[eventText] = reminderTime;
      print('Reminder set for $eventText at $reminderTime');
    } else {
      print('Event not found');
    }
  }
  void viewEvents(DateTime date) {
    if (events.containsKey(date)) {
      print('Events on $date: ${events[date]}');
    } else {
      print('No events on $date');
    }
  }
  void viewReminders() {
    if (reminders.isNotEmpty) {
      print('Reminders: $reminders');
    } else {
      print('No reminders set');
    }
  }
}
void main() {
  final calendar = Calendar(events: {}, reminders: {});
  DateTime date = DateTime.now();
  calendar.addEvent(date, 'Meeting with John at 2pm');
  calendar.setReminder('Meeting with John at 2pm', TimeOfDay(hour: 14, minute: 0));
  calendar.viewEvents(date);
  calendar.viewReminders();
}