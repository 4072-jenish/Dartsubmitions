import 'dart:async';

class Timer {
  Duration duration;
  Duration currentTime;
  Timer? _timer;

  Timer({required this.duration}) : currentTime = duration;

  void start() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = currentTime - Duration(seconds: 1);
        if (currentTime <= Duration(seconds: 0)) {
          timer.cancel();
        }
      });
    });
  }

  void stop() {
    _timer?.cancel();
  }
}