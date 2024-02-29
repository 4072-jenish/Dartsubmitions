import 'dart:math';


class Individual {
  List<dynamic> genome;
  double fitness;

  Individual(this.genome, this.fitness);
}

class GeneticProgramming {
  List<Individual> population;
  double Function(List<dynamic>) fitnessFunction;
  Random random;

  GeneticProgramming(this.fitnessFunction, {int populationSize = 100}) {
    population = List.generate(populationSize, (_) => generateRandomIndividual());
    random = Random();
  }

  
  Individual generateRandomIndividual() {
    
    List<dynamic> randomGenome = List.generate(10, (_) => random.nextDouble());
    double fitness = fitnessFunction(randomGenome);
    return Individual(randomGenome, fitness);
  }

  
  List<Individual> select(double selectionRate) {
   
    population.sort((a, b) => b.fitness.compareTo(a.fitness));
    
    /
    int selectedCount = (population.length * selectionRate).toInt();
    return population.sublist(0, selectedCount);
  }

  void mutate(Individual individual, double mutationRate) {
    for (int i = 0; i < individual.genome.length; i++) {
      if (random.nextDouble() < mutationRate) {
        individual.genome[i] = random.nextDouble();
      }
    }
    individual.fitness = fitnessFunction(individual.genome);
  }

 
  Individual crossover(Individual parent1, Individual parent2) {
    int crossoverPoint = random.nextInt(parent1.genome.length);
    List<dynamic> childGenome =
        List.from(parent1.genome.getRange(0, crossoverPoint))
          ..addAll(parent2.genome.getRange(crossoverPoint, parent2.genome.length));
    double fitness = fitnessFunction(childGenome);
    return Individual(childGenome, fitness);
  }


  void evolve({double selectionRate = 0.5, double mutationRate = 0.1}) {
    List<Individual> selected = select(selectionRate);

    List<Individual> newPopulation = [];
    for (int i = 0; i < population.length; i++) {
      if (i < selected.length) {
        newPopulation.add(selected[i]);
      } else {
        Individual parent1 = selected[random.nextInt(selected.length)];
        Individual parent2 = selected[random.nextInt(selected.length)];
        Individual child = crossover(parent1, parent2);
        mutate(child, mutationRate);
        newPopulation.add(child);
      }
    }

  
    population = newP
  }