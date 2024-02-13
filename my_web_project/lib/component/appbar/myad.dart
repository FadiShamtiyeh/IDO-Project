import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _showForm = !_showForm;
            });
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
        ),
        Visibility(
          visible: _showForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Due Date'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Estimate Time'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Importance'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your logic to save the task here
                  setState(() {
                    _showForm = false;
                  });
                },
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
