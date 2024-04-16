import 'package:expenses_tracker/custom_widgets/expenses_list/expense_item.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.registeredExpenses, this.removeExpense, {super.key});

  final List<Expense> registeredExpenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registeredExpenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          removeExpense(registeredExpenses[index]);
        },
        key: ValueKey(registeredExpenses[index]),
        child: ExpenseItem(registeredExpenses[index]),
      ),
    );
  }
}
