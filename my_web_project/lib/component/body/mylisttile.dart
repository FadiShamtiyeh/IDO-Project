// ignore_for_file: library_private_types_in_public_api, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_web_project/component/body/myeditablerow.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final String category;
  final String dueDate;
  final String estimate;
  //final double number;
  //final String unit;
  final String importance;

  const CustomListTile({
    super.key,
    required this.title,
    required this.category,
    required this.dueDate,
    required this.importance,
    required this.estimate,

    //required this.number,
    //required this.unit,
  });

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  late TextEditingController _textEditingController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        onTap: () {
          setState(() {
            _isEditing = true;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: _isEditing
              ? TextFormField(
                  controller: _textEditingController,
                  autofocus: true,
                  onFieldSubmitted: (value) {
                    setState(() {
                      _isEditing = false;
                    });
                  },
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                    fontFamily: 'HelveticaNeue',
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                )
              : Text(
                  _textEditingController.text.isEmpty
                      ? 'Tap to edit'
                      : _textEditingController.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                    fontFamily: 'HelveticaNeue',
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //const SizedBox(height: 10.0),
          CustomRow(
            label: 'Category',
            value: widget.category,
          ),
          // const SizedBox(height: 10.0),
          CustomRow(
            label: 'Due Date',
            value: widget.dueDate,
          ),
          // const SizedBox(height: 10.0),
          // CustomRow(
          //     label: 'Estimate', number: widget.number, unit: widget.unit),
          CustomRow(label: 'Estimate', value: widget.estimate),
          // const SizedBox(height: 10.0),
          CustomRow(
            label: 'Importance',
            value: widget.importance,
          )
          //const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
