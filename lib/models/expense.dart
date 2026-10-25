import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

part 'expense.g.dart';

final formatter = DateFormat.yMd();
final uuid = Uuid();

@HiveType(typeId: 0)
enum Category {
  @HiveField(0)
  food,
  @HiveField(1)
  travel,
  @HiveField(2)
  other,
  @HiveField(3)
  work,
  //@HiveField(4)
  //other,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.other: Icons.movie,
  Category.work: Icons.work,
  //Category.other: Icons.other,
};

@HiveType(typeId: 1)
class Expense extends HiveObject {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
