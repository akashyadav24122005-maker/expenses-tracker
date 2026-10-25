import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 100, 158, 29),
        title: const Text(
          'Help',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1️⃣ How to use the app?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '''
This application helps you track and manage your daily expenses and income in a simple way.
You can record every transaction to keep a clear overview of your financial activities.
To add an expense, select the Add Expense or Cash Out option, enter the amount, choose a category, and add a short description. The transaction will then be saved in your expense list.
To record income, select the Add Income or Cash In option, enter the amount, and save the transaction.
All your transactions are displayed in the dashboard and report section, allowing you to monitor your spending and manage your finances more effectively.
                ''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '2️⃣ How to add an expense?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '''
To add a new expense:
 1. Open the Expense Manager app
 2. Click on the Add Expense button
 3. Enter the amount spent
 4. Select the category (Food, Travel, Shopping, etc.)
 5. Add a short note or description
 6. Tap Save
Your expense will be recorded and shown in the expense list and reports.
''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '3️⃣ How to delete a transaction?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '''
If you want to remove a transaction:
 1. Open the transaction list
 2. Select the transaction you want to delete
 3. Tap the delete icon
 4. Confirm the action
The selected transaction will be permanently removed from the app.
''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '4️⃣ How does the expense report work?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '''
The Expense Report section provides a summary of your spending and income.
It helps you understand where your money is going by showing your total expenses and income over time.
This feature allows you to analyze your financial habits and manage your budget more efficiently.
''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                '5️⃣ Is my data stored safely?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '''
Yes. All your expense data is stored securely on your device using local storage.
Your information remains private and is only accessible through the application.
''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                '6️⃣ What is the purpose of this app?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '''
The main goal of this app is to help users track their daily financial activities, manage expenses, and improve budgeting habits.
With a simple interface and easy navigation, the app makes expense tracking quick and convenient.
''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
