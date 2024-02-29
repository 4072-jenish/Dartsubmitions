class DistributedDatabaseSystem {
  List<String> _nodes;
  List<Map<String, dynamic>> _dataPartitions;

  DistributedDatabaseSystem(this._nodes, this._dataPartitions);

  
  void replicate(Map<String, dynamic> data) {
    for (var node in _nodes) {
      _dataPartitions[_nodes.indexOf(node)] = Map.from(data);
    }
    print("Data replicated to all nodes.");
  }


  dynamic query(String node) {
    int index = _nodes.indexOf(node);
    if (index != -1) {
      print("Querying data from node: $node");
      return _dataPartitions[index];
    } else {
      print("Node $node not found.");
      return null;
    }
  }
}

void main() {

  List<String> nodes = ['Node1', 'Node2', 'Node3'];
  List<Map<String, dynamic>> dataPartitions = [
    {'data': 'partition1'},
    {'data': 'partition2'},
    {'data': 'partition3'}
  ];

 
  var databaseSystem = DistributedDatabaseSystem(nodes, dataPartitions);


  databaseSystem.replicate({'key': 'value'});

  
  print(databaseSystem.query('Node2'));
}
