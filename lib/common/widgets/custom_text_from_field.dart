import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final String? hintText;

  const CustomTextFromField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: Theme.of(context).colorScheme.onSurface,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(224, 229, 237, 1), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(186, 210, 234, 1), width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(255, 72, 106, 1), width: 1),
            ),
            errorStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 12,
                  color: const Color.fromRGBO(255, 72, 106, 1),
                ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color.fromRGBO(169, 176, 197, 1),
                ),
            suffixIcon: suffixIcon),
        validator: validator);
  }
}
