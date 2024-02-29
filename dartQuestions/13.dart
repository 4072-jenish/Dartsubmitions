class QFTSimulator {
  // Properties
  List<Particle> particles;
  Map<String, Field> fields;

  // Constructor
  QFTSimulator() {
    particles = [];
    fields = {};
  }

  // Methods

  // Evolve the system for a given amount of time
  void evolve(double time) {
    // Implement time evolution for the particles and fields
  }

  // Calculate the expectation value of a given observable
  double calculateObservable(String observable) {
    // Implement the calculation of the expectation value
    // using the particles and fields in the system
  }

  // Add a particle to the system
  void addParticle(Particle particle) {
    particles.add(particle);
  }

  // Add a field to the system
  void addField(Field field) {
    fields[field.name] = field;
  }
}

// Example particle class
class Particle {
  String name;
  double mass;

  Particle(this.name, this.mass);
}

// Example field class
class Field {
  String name;
  double couplingConstant;

  Field(this.name, this.couplingConstant);
}