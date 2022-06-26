import 'package:flutter/material.dart';

class IconTextField extends StatelessWidget {
  final String? hintText;
  final String labelText;
  final IconData icon;

  final bool isMultipleLine;
  final String? initialText;

  final FormFieldValidator<String>? validator;

  final bool readOnly;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;

  final TextEditingController? controller;

  const IconTextField({
    Key? key,
    required this.labelText,
    required this.icon,
    this.hintText,
    this.initialText,
    this.validator,
    this.isMultipleLine = false,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: !isMultipleLine ? 1 : null,
      initialValue: initialText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        icon: Icon(icon),
      ),
      onChanged: onChanged,
    );
  }
}
