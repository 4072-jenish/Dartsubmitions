class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double get area => width * height;

  void setWidth(double width) {
    this.width = width;
  }

  void setHeight(double height) {
    this.height = height;
  }

  @override
  String toString() {
    return 'Rectangle(width: $width, height: $height, area: $area)';
  }
}