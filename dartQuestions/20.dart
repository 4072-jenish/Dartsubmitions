import 'dart:math';

class QuantumErrorCorrectionSystem {
  List<int> _qubits;
  List<int> _errorSyndromes;

  QuantumErrorCorrectionSystem(int numQubits) {
   
    _qubits = List.generate(numQubits, (_) => Random().nextInt(2));
    _errorSyndromes = List.generate(numQubits ~/ 2, (_) => 0); 
  }

  void detectErrors() {
    for (int i = 0; i < _qubits.length ~/ 2; i++) {
     
      _errorSyndromes[i] = (_qubits[i * 2] + _qubits[i * 2 + 1]) % 2;
    }
  }

  
  void correctErrors() {
    for (int i = 0; i < _qubits.length ~/ 2; i++) {
      if (_errorSyndromes[i] == 1) {
       
        _qubits[i * 2] = _qubits[i * 2] == 0 ? 1 : 0;
      }
    }
  }

  
  void printQubits() {
    print("Qubits: $_qubits");
  }
}

void main() {
                                        
  var errorCorrectionSystem = QuantumErrorCorrectionSystem(6);

 
  errorCorrectionSystem.detectErrors();

  
  print("Before correction:");
  errorCorrectionSystem.printQubits();


  errorCorrectionSystem.correctErrors();

 
  print("\nAfter correction:");
  errorCorrectionSystem.printQubits();
}
