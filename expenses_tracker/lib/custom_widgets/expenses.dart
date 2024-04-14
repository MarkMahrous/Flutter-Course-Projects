import 'package:expenses_tracker/custom_widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker/custom_widgets/new_expense.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema",
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _addNewExpense(
      String title, double amount, DateTime date, Category category) {
    setState(() {
      _registeredExpenses.add(Expense(
          title: title, amount: amount, date: date, category: category));
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense removed!'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    // context is the build context of _ExpensesState and includes metadata about it.
    // but ctx is the build context of the showModalBottomSheet and includes metadata about it.
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addNewExpense: _addNewExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            const Text('chart'),
            Expanded(
              child: _registeredExpenses.isEmpty
                  ? const Center(
                      child:
                          Text('There is no Expenses yet, Start adding some.'))
                  : ExpensesList(_registeredExpenses, _removeExpense),
            ),
          ],
        ),
      ),
    );
  }
}
