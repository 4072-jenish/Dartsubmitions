class Budget {
  double _income = 0.0;
  double _expenses = 0.0;

  double get income => _income;
  double get expenses => _expenses;

  void addExpense(double amount) {
    _expenses += amount;
  }

  void setIncome(double amount) {
    _income = amount;
  }

  double get balance {
    return _income - _expenses;
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Budget App'),
        ),
        body: BudgetWidget(),
      ),
    );
  }
}

class BudgetWidget extends StatefulWidget {
  @override
  _BudgetWidgetState createState() => _BudgetWidgetState();
}

class _BudgetWidgetState extends State<BudgetWidget> {
  final Budget _budget = Budget();

  final TextEditingController _expenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Income: ${_budget.income}'),
        Text('Expenses: ${_budget.expenses}'),
        Text('Balance: ${_budget.balance}'),
        TextField(
          controller: _expenseController,
          decoration: InputDecoration(hintText: 'Add expense'),
        ),
        RaisedButton(
          onPressed: () {
            if (_expenseController.text.isNotEmpty) {
              _budget.addExpense(double.parse(_expenseController.text));
              _expenseController.clear();
            }
          },
          child: Text('Add Expense'),
        ),
        RaisedButton(
          onPressed: () {
            _budget.setIncome(10000.0);
          },
          child: Text('Set Income'),
        ),
      ],
    );
  }
}