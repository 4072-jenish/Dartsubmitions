class Student {
  String name;
  int age;
  List<double> grades;

  Student(this.name, this.age, [this.grades = const []]);

  double get averageGrade {
    if (grades.isEmpty) {
      return 0.0;
    } else {
      double sum = grades.reduce((a, b) => a + b);
      return sum / grades.length;
    }
  }

  void addGrade(double grade) {
    grades.add(grade);
  }

  @override
  String toString() {
    return 'Student(name: $name, age: $age, grades: $grades, averageGrade: $averageGrade)';
  }
}