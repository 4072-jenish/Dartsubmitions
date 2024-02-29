import 'dart:async';

// Define a class representing a node in the distributed system
class Node {
  final int id;
  List<int> neighbors;

  Node(this.id, this.neighbors);

  // Method to send a message to a neighbor node
  void send(int neighborId, dynamic message) {
    print('Node $id sending message to Node $neighborId: $message');
    // Simulate network delay by using Future.delayed
    Future.delayed(Duration(milliseconds: 100), () {
      nodes[neighborId].receive(id, message);
    });
  }

  // Method to receive a message from a neighbor node
  void receive(int senderId, dynamic message) {
    print('Node $id received message from Node $senderId: $message');
  }
}

// Define a class representing the distributed computing system
class DistributedSystem {
  List<Node> nodes;

  DistributedSystem(this.nodes);

  // Method to send a message from one node to another
  void send(int senderId, int receiverId, dynamic message) {
    nodes[senderId].send(receiverId, message);
  }
}

// Example usage
void main() {
  // Create nodes in the distributed system
  List<Node> nodes = [
    Node(0, [1, 2]),
    Node(1, [0]),
    Node(2, [0]),
  ];

  // Create the distributed system
  DistributedSystem system = DistributedSystem(nodes);

  // Send messages between nodes
  system.send(0, 1, 'Hello from Node 0 to Node 1!');
  system.send(1, 0, 'Hello from Node 1 to Node 0!');
  system.send(0, 2, 'Hello from Node 0 to Node 2!');
}
