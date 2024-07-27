import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalshi/core/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  CustomTextFormField({
    super.key,
    required this.controller,
    required this.title,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
  });

  final borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(
      width: 1,
      color: Color(0xFFE9EEF2),
      style: BorderStyle.solid,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textDescription.copyWith(
            color: const Color(0xFF1E2A32),
          ),
        ),
        const SizedBox(height: 7),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: borderStyle,
            focusedBorder: borderStyle,
            enabledBorder: borderStyle,
            prefixIcon: Image.asset('assets/images/dollar-sign.png'),
          ),
          style: textLGHeadingSmall,
          validator: validator,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
