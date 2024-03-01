class BankAccount {
  String accountNumber;
  double balance;
  double interestRate;
  BankAccount({required this.accountNumber, required this.balance, required this.interestRate});
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('$amount has been deposited. New balance: $balance');
    } else {
      print('Invalid deposit amount');
    }
  }
  bool withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print('$amount has been withdrawn. New balance: $balance');
      return true;
    } else {
      print('Invalid or insufficient funds');
      return false;
    }
  }
  void calculateInterest() {
    double interest = balance * interestRate;
    print('Interest earned: $interest');
  }
}
void main() {
  final account = BankAccount(accountNumber: '123456789', balance: 1000.0, interestRate: 0.05);
  account.deposit(500.0);
  account.withdraw(200.0);
  account.calculateInterest();
}