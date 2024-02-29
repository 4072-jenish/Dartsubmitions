class RoboticsControlSystem {
  / Properties
  List<Sensor> sensors;
  List<Actuator> actuators;

  RoboticsControlSystem() {
    sensors = [];
    actuators = [];
  }

  

 
  void sense() {
    
  }

  
  void act() {

    

  
  void addSensor(Sensor sensor) {
    sensors.add(sensor);
  }

  
  void addActuator(Actuator actuator) {
    actuators.add(actuator);
  }
}


class Sensor {
  String name;
  Function readData;

  Sensor(this.name, this.readData);
}


class Actuator {
  String name;
  Function sendAction;

  Actuator(this.name, this.sendAction);
}