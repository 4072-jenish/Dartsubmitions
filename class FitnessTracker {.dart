class FitnessTracker {
  List<Workout> _workouts = [];
  int _caloriesBurned = 0;

  List<Workout> get workouts => _workouts;
  int get caloriesBurned => _caloriesBurned;

  void logWorkout(Workout workout) {
    _workouts.add(workout);
    _caloriesBurned += workout.caloriesBurned;
  }

  void reset() {
    _workouts.clear();
    _caloriesBurned = 0;
  }
}

class Workout {
  final String id;
  final String name;
  final int duration; // in minutes
  final double caloriesBurnedPerMinute;

  Workout(this.id, this.name, this.duration, this.caloriesBurnedPerMinute);

  int get caloriesBurned {
    return duration * caloriesBurnedPerMinute;
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fitness Tracker'),
        ),
        body: FitnessTrackerWidget(),
      ),
    );
  }
}

class FitnessTrackerWidget extends StatefulWidget {
  @override
  _FitnessTrackerWidgetState createState() => _FitnessTrackerWidgetState();
}

class _FitnessTrackerWidgetState extends State<FitnessTrackerWidget> {
  final FitnessTracker _fitnessTracker = FitnessTracker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();

  void _addWorkout() {
    if (_nameController.text.isNotEmpty &&
        _durationController.text.isNotEmpty &&
        _caloriesController.text.isNotEmpty) {
      final String id = DateTime.now().toString();
      final String name = _nameController.text;
      final int duration = int.parse(_durationController.text);
      final double caloriesBurnedPerMinute =
          double.parse(_caloriesController.text) / duration;

      final Workout workout = Workout(id, name, duration, caloriesBurnedPerMinute);

      _fitnessTracker.logWorkout(workout);

      _nameController.clear();
      _durationController.clear();
      _caloriesController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Calories Burned: ${_fitnessTracker.caloriesBurned}'),
        Expanded(
          child: ListView.builder(
            itemCount
      ]
    )

  };
