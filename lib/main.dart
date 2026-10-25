import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:third_projects/expenses.dart';
import 'package:third_projects/models/expense.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(245, 176, 236, 206),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(245, 40, 218, 84),
  brightness: Brightness.dark,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ExpenseAdapter());

  await Hive.openBox<Expense>('expensesBox');

  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(245, 22, 22, 22),
        colorScheme: kDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(245, 198, 203, 199),
          foregroundColor: const Color.fromARGB(255, 202, 214, 206),
        ),
      ),

      theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(245, 230, 239, 234),
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(245, 61, 245, 156),
          foregroundColor: const Color.fromARGB(255, 43, 241, 122),
        ),
      ),

      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,

      home: Expenses(),
    ),
  );
}
