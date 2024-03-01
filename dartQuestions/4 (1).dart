import 'dart:io';
class GameCharacter {
  int health;
  List<String> inventory = [];
  Map<String, int> skills = {};
  GameCharacter({required this.health, required this.inventory, required this.skills});
  void attack(GameCharacter target) {
    if (skills.containsKey('attack')) {
      target.health -= skills['attack']!;
      print('${this.runtimeType} ${this.hashCode} attacked ${target.runtimeType} ${target.hashCode} for ${skills['attack']} damage.');
    } else {
      print('${this.runtimeType} ${this.hashCode} does not have an attack skill.');
    }
  }
  void defend() {
    if (skills.containsKey('defense')) {
      skills['defense']! += 10;
      print('${this.runtimeType} ${this.hashCode} increased its defense by 10.');
    } else {
      print('${this.runtimeType} ${this.hashCode} does not have a defense skill.');
    }
  }
  void addItemToInventory(String item) {
    inventory.add(item);
    print('${this.runtimeType} ${this.hashCode} added $item to its inventory.');
  }
  void removeItemFromInventory(String item) {
    if (inventory.contains(item)) {
      inventory.remove(item);
      print('${this.runtimeType} ${this.hashCode} removed $item from its inventory.');
    } else {
      print('${this.runtimeType} ${this.hashCode} does not have $item in its inventory.');
    }
  }
}
void main() {
  final hero = GameCharacter(health: 100, inventory: ['sword'], skills: {'attack': 20, 'defense': 10});
  final enemy = GameCharacter(health: 50, inventory: ['shield'], skills: {'attack': 10, 'defense': 15});
  hero.attack(enemy);
  enemy.defend();
  hero.addItemToInventory('healing potion');
  hero.removeItemFromInventory('sword');
}