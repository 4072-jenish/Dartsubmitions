class Stopwatch {
  DateTime? _startTime;
  DateTime? _endTime;

  void start() {
    _startTime = DateTime.now();
  }

  void stop() {
    _endTime = DateTime.now();
  }

  Duration get elapsedTime {
    if (_startTime == null || _endTime == null) {
      throw Exception('Stopwatch has not been stopped yet.');
    }
    return _endTime!.difference(_startTime!);
  }

  void reset() {
    _startTime = null;
    _endTime = null;
  }
}
void main() {
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  // Do some work here

  stopwatch.stop();
  print('Elapsed time: ${stopwatch.elapsedTime}');

  stopwatch.reset();
}