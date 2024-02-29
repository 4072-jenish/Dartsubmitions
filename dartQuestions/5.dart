import 'dart:math';

class Environment {
  int stateSpaceSize; 
  int actionSpaceSize; 

  Environment(this.stateSpaceSize, this.actionSpaceSize);

  
  int step(int action) {
    
    int nextState = Random().nextInt(stateSpaceSize);
    int reward = Random().nextInt(10); 
    return reward;
  }
}


class Agent {
  List<double> qTable; 
  double learningRate; 
  double discountFactor; 
  double explorationRate; 

  Agent(int stateSpaceSize, int actionSpaceSize,
      {this.learningRate = 0.1, this.discountFactor = 0.9, this.explorationRate = 0.1}) {

    qTable = List.filled(stateSpaceSize * actionSpaceSize, 0.0);
  }

  int selectAction(int state) {
   
    if (Random().nextDouble() < explorationRate) {
     
      return Random().nextInt(actionSpaceSize);
    } else {
      
      int startIndex = state * actionSpaceSize;
      int endIndex = startIndex + actionSpaceSize;
      return qTable.sublist(startIndex, endIndex).indexOf(qTable.sublist(startIndex, endIndex).reduce(max));
    }
  }
\
  void learn(int state, int action, int reward, int nextState) {
\
    int index = state * actionSpaceSize + action;
    double maxQValue = qTable.sublist(nextState * actionSpaceSize, (nextState + 1) * actionSpaceSize).reduce(max);
    qTable[index] += learningRate * (reward + discountFactor * maxQValue - qTable[index]);
  }
}
\
class ReinforcementLearningSystem {
  Environment environment;
  Agent agent;

  ReinforcementLearningSystem(this.environment, this.agent);

  void observe(int numEpisodes) {
    for (int episode = 0; episode < numEpisodes; episode++) {
      int state = Random().nextInt(environment.stateSpaceSize); 
      while (true) {
        int action = agent.selectAction(state); 
        int reward = environment.step(action); 
        int nextState = Random().nextInt(environment.stateSpaceSize); 
        
        agent.learn(state, action, reward, nextState); 
        
        state = nextState; 
        
        if (episode == numEpisodes - 1) {
          print('Episode: $episode, State: $state, Action: $action, Reward: $reward');
        }

        if (state == environment.stateSpaceSize - 1) {
          break;
        }
      }
    }
  }
}


void main() {
  Environment environment = Environment(10, 4);
  
 
  Agent agent = Agent(environment.stateSpaceSize, environment.actionSpaceSize);
  
  ReinforcementLearningSystem rlSystem = ReinforcementLearningSystem(environment, agent);
  
  rlSystem.observe(1000);
}
