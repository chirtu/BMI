
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String? title;
  var hint;
  final bool obscureText;
  final String? errorText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Widget? suffix;
  final bool readOnly;
  final VoidCallback? onTap;
  FormTextField({
    required this.controller,
     this.title,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.obscureText = false,
    this.readOnly = false,
    this.errorText,
    this.suffix,
    this.onTap,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hint,
        labelText: title,
        suffix: suffix,
      ),
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
