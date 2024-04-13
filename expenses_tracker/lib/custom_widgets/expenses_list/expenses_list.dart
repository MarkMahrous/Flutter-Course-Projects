import 'package:expenses_tracker/custom_widgets/expenses_list/expense_item.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.registeredExpenses, {super.key});

  final List<Expense> registeredExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registeredExpenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(registeredExpenses[index]),
    );
  }
}
