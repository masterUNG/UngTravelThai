// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    required this.hint,
    required this.changeFunc,
    this.top,
  }) : super(key: key);

  final String hint;
  final Function(String) changeFunc;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top ?? 16),
      width: 250,
      height: 40,
      child: TextFormField(
        onChanged: changeFunc,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: hint,
        ),
      ),
    );
  }
}
