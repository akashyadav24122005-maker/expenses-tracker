import 'package:flutter/material.dart';
import 'package:third_projects/models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Rs:${expense.amount.toStringAsFixed(2)}',
                  style: TextStyle(color: textColor),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]!, color: textColor),
                    const SizedBox(width: 8),
                    Text(
                      expense.formattedDate,
                      style: TextStyle(color: textColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
