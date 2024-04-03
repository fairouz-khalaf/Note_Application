import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSave,
      this.onChanged});
  final String hint;
  final int maxLines;

  final void Function(String?)? onSave;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSave,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 18,
          color: primaryColor,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(primaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}
