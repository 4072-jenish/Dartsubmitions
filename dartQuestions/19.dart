import 'dart:async';

class ParallelComputingSystem {
  List<Future> _threads = [];

  void spawn(Function task) {
    var thread = Future(() {
      task();
    });

    _threads.add(thread);
  }

  Future<void> join() async {
    await Future.wait(_threads);
  }
}

void main() {
  var computingSystem = ParallelComputingSystem();

  computingSystem.spawn(() {
    print("Thread 1 started");

    Future.delayed(Duration(seconds: 2), () => print("Thread 1 completed"));
  });

  computingSystem.spawn(() {
    print("Thread 2 started");

    Future.delayed(Duration(seconds: 1), () => print("Thread 2 completed"));
  });

  computingSystem.spawn(() {
    print("Thread 3 started");

    Future.delayed(Duration(seconds: 3), () => print("Thread 3 completed"));
  });

  computingSystem.join().then((_) => print("All threads completed"));
}
