import 'dart:math';

class Qubit {
  int state;
  double amplitude0;
  double amplitude1;
  Qubit(
      {required this.state,
      required this.amplitude0,
      required this.amplitude1});

  int measure() {
    double randomNumber = Random().nextDouble();
    if (randomNumber < amplitude0 * amplitude0) {
      state = 0;
    } else {
      state = 1;
    }
    return state;
  }
}

class Gate {
  String name;
  List<List<double>> matrix;

  Gate(this.name, this.matrix);
}

class QuantumComputer {
  List<Qubit> qubits;
  List<Gate> gates;

  QuantumComputer(this.qubits) {
    gates = [];
  }

  void applyGate(Gate gate, List<int> qubitIndices) {
    if (gate.matrix.length != pow(2, qubitIndices.length)) {
      throw ArgumentError(
          'The gate ${gate.name} cannot be applied to ${qubitIndices.length} qubits.');
    }

    for (int i = 0; i < qubitIndices.length; i++) {
      int qubitIndex = qubitIndices[i];
      for (int j = 0; j < qubits.length; j++) {
        Qubit qubit = qubits[j];
        if (j == qubitIndex) {
          double amplitude0 = 0;
          double amplitude1 = 0;
          for (int k = 0; k < qubits.length; k++) {
            amplitude0 += gate.matrix[0][k] * qubits[k].amplitude0;
            amplitude1 += gate.matrix[1][k] * qubits[k].amplitude1;
          }
          qubit.amplitude0 = amplitude0;
          qubit.amplitude1 = amplitude1;
        }
      }
    }

    gates.add(gate);
  }

  List<int> measureAll() {
    List<int> measurements = [];
    for (var qubit in qubits) {
      measurements.add(qubit.measure());
    }
    return measurements;
  }
}

void main() {
  Qubit qubit1 =
      Qubit(state: 0, amplitude0: 1 / sqrt(2), amplitude1: 1 / sqrt(2));
  Qubit qubit2 =
      Qubit(state: 0, amplitude0: 1 / sqrt(2), amplitude1: 1 / sqrt(2));

  QuantumComputer quantumComputer = QuantumComputer([qubit1, qubit2]);

  Gate hadamardGate = Gate('Hadamard', [
    [1 / sqrt(2), 1 / sqrt(2)],
    [1 / sqrt(2), -1 / sqrt(2)],
  ]);

  quantumComputer.applyGate(hadamardGate, [0]);

  List<int> measurements = quantumComputer.measureAll();

  print('Measurements: $measurements');
}
