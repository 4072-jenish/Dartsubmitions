class Loan {
  final double amount;
  final double interestRate;
  final int duration; // in months

  Loan(this.amount, this.interestRate, this.duration);

  double calculateInterest() {
    return amount * interestRate * duration / 12 / 100;
  }

  double repay(double monthlyPayment) {
    double remainingBalance = amount;
    double totalInterest = 0;
    for (int i = 0; i < duration; i++) {
      double interest = remainingBalance * interestRate / 12 / 100;
      double principal = monthlyPayment - interest;
      remainingBalance -= principal;
      totalInterest += interest;
      if (remainingBalance <= 0) {
        remainingBalance = 0;
        break;
      }
    }
    return totalInterest;
  }
}

void main() {
  final loan = Loan(10000, 5, 60);
  print('Interest: ${loan.calculateInterest()}');
  print('Monthly payment: 219.98');
  print('Total repayment: ${loan.repay(219.98)}');
}