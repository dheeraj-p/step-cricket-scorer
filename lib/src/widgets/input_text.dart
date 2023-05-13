import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String? label;
  final Function(String)? onChanged;

  const InputText({super.key, this.onChanged, this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      onChanged: onChanged,
    );
  }
}
