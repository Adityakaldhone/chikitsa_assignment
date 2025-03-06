import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DynamicDateSelector extends StatefulWidget {
  final Function(DateTime selectedDate) onDateChanged;

  const DynamicDateSelector({super.key, required this.onDateChanged});

  @override
  State<DynamicDateSelector> createState() => _DynamicDateSelectorState();
}

class _DynamicDateSelectorState extends State<DynamicDateSelector> {
  DateTime currentDate = DateTime.now();

  void changeDate(int days) {
    setState(() {
      currentDate = currentDate.add(Duration(days: days));
      widget.onDateChanged(currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Previous day
    DateTime previousDate = currentDate.subtract(const Duration(days: 1));
    // Next day
    DateTime nextDate = currentDate.add(const Duration(days: 1));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous Day (faded)
        Text(
          DateFormat('E').format(previousDate),
          style: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
        ),

        IconButton(
          onPressed: () => changeDate(-1),
          icon: const Icon(Icons.chevron_left, color: Colors.blue),
        ),

        // Current Date (highlighted pill)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.teal.shade900,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            DateFormat('EEEE, MMM d').format(currentDate),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        IconButton(
          onPressed: () => changeDate(1),
          icon: const Icon(Icons.chevron_right, color: Colors.blue),
        ),

        // Next Day (faded)
        Text(
          DateFormat('E').format(nextDate),
          style: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
