import 'package:flutter/material.dart';
import 'package:third_projects/setting_screen.dart';
import 'package:third_projects/widget/expenses_list.dart';
import 'package:third_projects/models/expense.dart';
import 'package:third_projects/widget/new_expense.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:third_projects/details_screen.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  late Box<Expense> expenseBox;

  int indexValue = 0;

  @override
  void initState() {
    super.initState();
    expenseBox = Hive.box<Expense>('expensesBox');
  }

  double get totalAmount {
    double total = 0;
    for (final expense in expenseBox.values) {
      total += expense.amount;
    }
    return total;
  }

  double get foodAmount {
    double total = 0;
    for (final expense in expenseBox.values) {
      if (expense.category == Category.food) {
        total += expense.amount;
      }
    }
    return total;
  }

  double get workAmount {
    double total = 0;
    for (final expense in expenseBox.values) {
      if (expense.category == Category.work) {
        total += expense.amount;
      }
    }
    return total;
  }

  double get travelAmount {
    double total = 0;
    for (final expense in expenseBox.values) {
      if (expense.category == Category.travel) {
        total += expense.amount;
      }
    }
    return total;
  }

  double get otherAmount {
    double total = 0;
    for (final expense in expenseBox.values) {
      if (expense.category == Category.other) {
        total += expense.amount;
      }
    }
    return total;
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    expenseBox.add(expense);
  }

  void _removeExpense(Expense expense) {
    final deletedKey = expense.key;
    final deletedExpense = expense;

    expense.delete();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            expenseBox.put(deletedKey, deletedExpense);
          },
        ),
      ),
    );
  }

  Widget _getSelectedScreen() {
    if (indexValue == 2) {
      return const SettingScreen();
    }

    if (indexValue == 1) {
      return DetailsScreen(
        totalAmount: totalAmount,
        foodAmount: foodAmount,
        workAmount: workAmount,
        otherAmount: otherAmount,
        travelAmount: travelAmount,
      );
    }

    return ValueListenableBuilder(
      valueListenable: expenseBox.listenable(),
      builder: (context, Box<Expense> box, _) {
        final expenses = box.values.toList();

        Widget mainContent;

        if (expenses.isEmpty) {
          mainContent = Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('No expenses found. Start adding some!'),
                SizedBox(height: 10),
                Image(
                  image: AssetImage('assets/images/LS20260303164609.png'),
                  width: 200,
                ),
              ],
            ),
          );
        } else {
          mainContent = ExpensesList(
            expenses: expenses,
            onRemoveExpense: _removeExpense,
          );
        }

        return Column(
          children: [
            const Text(
              'EXPENSE REPORT',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 100, 158, 29),
                decoration: TextDecoration.underline,
              ),
            ),
            Expanded(child: mainContent),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 100, 158, 29),
        title: const Text(
          'EXPENSES MANAGEMENT',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 100, 158, 29),
        fixedColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(124, 11, 54, 6),
        currentIndex: indexValue,
        onTap: (index) {
          setState(() {
            indexValue = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Manager',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
      body: _getSelectedScreen(),
    );
  }
}
