class Bank {
  List<String> accounts = [];
  List<String> loans = [];
  void openAccount(String accountNumber) {
    accounts.add(accountNumber);
    print('Account $accountNumber has been opened.');
  }
  void approveLoan(String loanNumber) {
    loans.add(loanNumber);
    print('Loan $loanNumber has been approved.');
  }
}
void main() {
  final bank = Bank();
  bank.openAccount('99999');
  bank.approveLoan('7845011');
}