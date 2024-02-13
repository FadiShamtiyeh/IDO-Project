import 'package:flutter/material.dart';

class CustomRow extends StatefulWidget {
  final String label;
  final String value;
  final void Function(String)? onValueChanged; // Define a callback function

  // Constructor for CustomRow
  const CustomRow({
    Key? key,
    required this.label,
    required this.value,
    this.onValueChanged, // Pass the callback function as a parameter
  }) : super(key: key);

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  late TextEditingController _textEditingController;
  bool _isEditing = false;
  late String _dropdownValue;

  @override
  void initState() {
    super.initState();
    String displayValue = widget.value;
    if (widget.label == 'Due Date' && widget.value == '0000-00-00') {
      displayValue = 'None';
    }
    _textEditingController = TextEditingController(text: displayValue);
    _dropdownValue = widget.value;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 10.0,
            fontFamily: 'HelveticaNeue',
            letterSpacing: 0.0,
            height: 1.5,
            color: Color(0xFF6C757D),
          ),
        ),
        const Expanded(
          child: SizedBox(width: 20),
        ),
        Expanded(
          flex: 6,
          child: GestureDetector(
            onTap: () {
              if (widget.label == 'Due Date') {
                _selectDate(context);
              } else {
                setState(() {
                  _isEditing = true;
                });
              }
            },
            child: _isEditing && widget.label == 'Importance'
                ? DropdownButton<String>(
                    value: _dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        _dropdownValue = newValue ?? '';
                        _isEditing = false;
                        widget.onValueChanged?.call(newValue ?? '');
                      });
                    },
                    items: <String>['', 'Low', 'Medium', 'High']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: value == 'High'
                                ? const Color.fromRGBO(220, 53, 69, 1)
                                : value == 'Low'
                                    ? const Color.fromRGBO(57, 172, 149, 1)
                                    : value == 'Medium'
                                        ? const Color.fromRGBO(254, 145, 62, 1)
                                        : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: _dropdownValue == 'High'
                          ? const Color.fromRGBO(220, 53, 69, 1)
                          : _dropdownValue == 'Low'
                              ? const Color.fromRGBO(57, 172, 149, 1)
                              : _dropdownValue == 'Medium'
                                  ? const Color.fromRGBO(254, 145, 62, 1)
                                  : Colors.transparent,
                    ),
                    child: _isEditing
                        ? TextFormField(
                            controller: _textEditingController,
                            autofocus: true,
                            onFieldSubmitted: (value) {
                              setState(() {
                                _isEditing = false;
                                _dropdownValue = value;
                                widget.onValueChanged?.call(value);
                              });
                            },
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                              fontFamily: 'HelveticaNeue',
                              letterSpacing: 0.0,
                              height: 1.5,
                              color: Colors.white, // Change text color to white
                            ),
                          )
                        : Text(
                            _dropdownValue,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                              fontFamily: 'HelveticaNeue',
                              letterSpacing: 0.0,
                              height: 1.5,
                              color: Colors.white, // Change text color to white
                            ),
                          ),
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    if (widget.label == 'Due Date') {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        setState(() {
          String formattedDate = picked.toIso8601String().split('T')[0];
          _textEditingController.text = formattedDate;
          _dropdownValue = formattedDate; // Update dropdown value
          _isEditing = false;
          widget.onValueChanged?.call(formattedDate);
        });
      }
    }
  }
}
