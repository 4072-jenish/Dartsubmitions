class Bank {
  String name;
  String location;
  double balance;

  Bank(this.name, this.location, this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  bool withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }

  @override
  String toString() {
    return 'Bank(name: $name, location: $location, balance: $balance)';
  }
}