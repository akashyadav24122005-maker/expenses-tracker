# Expenses Tracker 💸

A clean, offline-first Flutter application for logging daily expenses, organizing them by category, and seeing exactly where your money goes. All data is stored locally on the device, so no account or internet connection is needed.

## 🚀 Features

### 🏠 Home (Expense Report)
* **Quick Add:** Tap `+` to open a bottom sheet and log an expense with title, amount (₹), date, and category.
* **Input Validation:** Empty titles, invalid or zero amounts, and missing dates are caught with a clear dialog before saving.
* **Swipe to Delete + Undo:** Swipe an expense away and restore it instantly from the snackbar.
* **Live List:** The list updates the moment data changes, with no manual refresh.
* **Empty State:** A friendly prompt and illustration when no expenses exist yet.

### 📊 Manager Dashboard
* **Total Spend:** See your overall total at a glance.
* **Category Breakdown:** Separate totals for `Food`, `Travel`, `Work`, and `Other`.

### ⚙️ Settings
* **Help & About:** Built-in screens explaining the app and its tech stack.
* **Light & Dark Themes:** Automatically follows the system theme (Material 3).

## 🛠️ Tech Stack

* **Framework:** Flutter (Dart), Material 3
* **Local Database:** [Hive](https://pub.dev/packages/hive) via [hive_flutter](https://pub.dev/packages/hive_flutter)
* **Date Formatting:** [intl](https://pub.dev/packages/intl)
* **Unique IDs:** [uuid](https://pub.dev/packages/uuid)
* **Code Generation:** `hive_generator` + `build_runner` (type adapters)

## 🧠 Core Architecture Highlights

### Reactive UI with Hive
The home screen wraps the Hive box in a `ValueListenableBuilder`, so adding or deleting an expense rebuilds the list automatically without any extra state-management library.

### Typed Local Storage
`Expense` extends `HiveObject` and `Category` is a Hive-registered enum, each with a fixed `typeId` and `HiveField` indexes. Adapters are registered once in `main()` before the `expensesBox` is opened.
* **Safe Schema Changes:** Never reuse or renumber an existing `HiveField` index, or previously saved data will break. Always add new fields with a new index.

### Undo Without Data Loss
On delete, the expense's key and object are held in memory, and the snackbar's **Undo** action writes it back with `put(key, expense)`, restoring the original record.

## 📁 Project Structure

```
lib/
├── main.dart               # Entry point, Hive init, light/dark themes
├── expenses.dart           # Main screen, bottom nav, category totals
├── details_screen.dart     # Manager tab: total and category breakdown
├── setting_screen.dart     # Settings tab
├── setting_inside/
│   ├── help.dart
│   └── about.dart
├── models/
│   ├── expense.dart        # Expense model + Category enum
│   └── expense.g.dart      # Generated Hive adapters
└── widget/
    ├── new_expense.dart    # Add-expense form
    ├── expenses_list.dart  # Swipeable list
    └── expenses_item.dart  # Single expense card
```

## 💻 Getting Started

### Prerequisites
* Flutter SDK (Latest Stable)
* Android Studio / VS Code
* An emulator or physical device

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/akashyadav24122005-maker/expenses-tracker.git
   cd expenses-tracker
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## 🐛 Regenerating Hive Adapters
If you edit `lib/models/expense.dart` (add a field or category), regenerate the adapters:
```bash
dart run build_runner build --delete-conflicting-outputs
```
This rewrites `expense.g.dart`. If the app crashes on launch after a model change, clear the app's data or uninstall it to remove the old Hive box.


## 👤 Author
**Akash Yadav** 