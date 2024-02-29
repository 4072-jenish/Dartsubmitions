class DataStructureLibrary {
  List<int> array;
  TreeNode root;

  DataStructureLibrary() {
    array = [];
    root = null;
  }

 
  void insertIntoArray(int element) {
    array.add(element);
  }

  
  bool searchInArray(int element) {
    return array.contains(element);
  }

  void insertIntoTree(int element) {
    if (root == null) {
      root = TreeNode(element);
    } else {
      _insertHelper(root, element);
    }
  }

  
  void _insertHelper(TreeNode node, int element) {
    if (element < node.value) {
      if (node.left == null) {
        node.left = TreeNode(element);
      } else {
        _insertHelper(node.left, element);
      }
    } else {
      if (node.right == null) {
        node.right = TreeNode(element);
      } else {
        _insertHelper(node.right, element);
      }
    }
  }

 
  bool searchInTree(int element) {
    return _searchHelper(root, element);
  }

  
  bool _searchHelper(TreeNode node, int element) {
    if (node == null) {
      return false;
    }
    if (node.value == element) {
      return true;
    } else if (element < node.value) {
      return _searchHelper(node.left, element);
    } else {
      return _searchHelper(node.right, element);
    }
  }
}

class TreeNode {
  int value;
  TreeNode left;
  TreeNode right;

  TreeNode(this.value);
}

void main() {
  var dsLibrary = DataStructureLibrary();

  // Array operations
  dsLibrary.insertIntoArray(5);
  dsLibrary.insertIntoArray(10);
  print(dsLibrary.searchInArray(5)); 
  print(dsLibrary.searchInArray(15));

  // Tree operations
  dsLibrary.insertIntoTree(50);
  dsLibrary.insertIntoTree(30);
  dsLibrary.insertIntoTree(70);
  print(dsLibrary.searchInTree(30)); 
  print(dsLibrary.searchInTree(40)); 
}
