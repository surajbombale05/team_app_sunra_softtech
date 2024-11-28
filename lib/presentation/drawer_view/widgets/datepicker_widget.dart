import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      print('Selected date: ${_selectedDate!.toLocal()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: const Text('Pick a Date'),
        ),
        const SizedBox(height: 16),
        Text(
          _selectedDate == null
              ? 'No date selected'
              : 'Selected Date: ${_selectedDate!.toLocal()}',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}