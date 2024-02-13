import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final double width;
  final double height;
  final String initialText;
  final bool obscure;
  final FormFieldValidator<String>? validator; // Add validator

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.width = 415,
    this.height = 30,
    this.initialText = '',
    this.obscure = false,
    this.validator, // Initialize validator
  }) : super(key: key); // Pass key to super constructor

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _focusNode = widget.focusNode;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 300,
          left: MediaQuery.of(context).size.width / 300,
        ),
        width: widget.width,
        height: widget.height + (_errorText != null ? 40 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: widget.height,
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
              decoration: BoxDecoration(
                color: _controller.text.isNotEmpty
                    ? Colors.white
                    : const Color(0xFF222222),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color:
                      _focusNode.hasFocus ? Colors.green : Colors.transparent,
                ),
              ),
              child: TextFormField(
                controller: _controller,
                focusNode: _focusNode,
                obscureText: widget.obscure,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (_) {
                  setState(() {});
                },
                validator: widget.validator != null
                    ? (value) {
                        setState(() {
                          _errorText = widget.validator!(value);
                        });
                        return null;
                      }
                    : null,
              ),
            ),
            if (_errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _errorText!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
