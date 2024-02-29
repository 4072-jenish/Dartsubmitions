import 'package:flutter/material.dart';

class Calendar {
  List<Appointment> events = [];
  List<DateTime> dates = [];

  void addEvent(Appointment event) {
    events.add(event);
    dates.add(event.from);
  }

  void removeEvent(Appointment event) {
    events.remove(event);
    dates.remove(event.from);
  }
}

class Appointment {
  Appointment({
    required this.eventName,
    required this.from,
    required this.to,
    required this.background,
    this.isAllDay = false,
    this.recurrenceRule,
    this.exceptionDates,
  });

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String? recurrenceRule;
  List<DateTime>? exceptionDates;
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calendar Example'),
        ),
        body: CalendarExample(),
      ),
    );
  }
}

class CalendarExample extends StatefulWidget {
  @override
  _CalendarExampleState createState() => _CalendarExampleState();
}

class _CalendarExampleState extends State<CalendarExample> {
  Calendar calendar = Calendar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: calendar.events.length,
            itemBuilder: (context, index) {
              final event = calendar.events[index];
              return ListTile(
                title: Text(event.eventName),
                subtitle: Text('${event.from} - ${event.to}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      calendar.removeEvent(event);
                    });
                  },
                ),
              );
            },
          ),
        ),
        TextButton(
          onPressed: () {
            final event = Appointment(
              eventName: 'New Event',
              from: DateTime.now(),
              to: DateTime.now().add(Duration(hours: 1)),
              background: Colors.blue,
            );
            setState(() {
              calendar.addEvent(event);
            });
          },
          child: Text('Add Event'),
        ),
      ],
    );
  }
}