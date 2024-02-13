// ignore_for_file: sized_box_for_whitespace, avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Custom widget for text input field
class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 18.0,
            fontFamily: 'HelveticaNeue',
            letterSpacing: 0.0,
            height: 1.5,
            color: Color(0xFF212529),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 35.0,
            width: 200.0,
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: hintText,
              ),
              keyboardType: keyboardType,
            ),
          ),
        ),
      ],
    );
  }
}

// Custom widget for dropdown field
class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final void Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 18.0,
            fontFamily: 'HelveticaNeue',
            letterSpacing: 0.0,
            height: 1.5,
            color: Color(0xFF212529),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 55.0,
            width: 200.0,
            child: DropdownButtonFormField<String>(
              value: value,
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                print('Dropdown value changed to: $newValue');
                onChanged(newValue);
              },
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DatePickerDialogContentState extends State<DatePickerDialogContent> {
  late DateTime _selectedDate;
  String? _selectedPriority;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now(); // Set initial date to current date
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomTextField(
          label: 'Title',
          hintText: 'Enter title',
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          label: 'Category',
          hintText: 'Enter category',
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const Text(
              'Due Date',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 18.0,
                fontFamily: 'HelveticaNeue',
                letterSpacing: 0.0,
                height: 1.5,
                color: Color(0xFF212529),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: Text(
                  DateFormat('yyyy-MM-dd').format(_selectedDate),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const Text(
              'Estimate',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 18.0,
                fontFamily: 'HelveticaNeue',
                letterSpacing: 0.0,
                height: 1.5,
                color: Color(0xFF212529),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 35.0,
                width: 200.0,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Number',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Container(
                height: 35.0,
                width: 200.0,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Unit',
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        CustomDropdown(
          label: 'Importance',
          items: const ['High', 'Low', 'Medium'],
          value: _selectedPriority,
          onChanged: (String? value) {
            setState(() {
              _selectedPriority = value;
            });
          },
        ),
      ],
    );
  }
}

class DatePickerDialogContent extends StatefulWidget {
  const DatePickerDialogContent({super.key});

  @override
  _DatePickerDialogContentState createState() =>
      _DatePickerDialogContentState();
}

class CustomAdd extends StatefulWidget {
  const CustomAdd({super.key});

  @override
  State<CustomAdd> createState() => _CustomAddState();
}

class _CustomAddState extends State<CustomAdd> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'I CAN DO IT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 72.0,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w100,
                  letterSpacing: 0.0,
                  color: Color(0xFF212529),
                  decoration: TextDecoration.none,
                ),
              ),
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return const DatePickerDialogContent();
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    debugPrint('OK');
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset('images/circle.png'),
          Positioned(
            top: 6,
            right: 6,
            bottom: 6,
            child: Image.asset(
              'images/add.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
