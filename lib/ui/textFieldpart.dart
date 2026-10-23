import 'package:flutter/material.dart';
import '../utiles/app_colors.dart';

class Textfieldpart extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final VoidCallback onChanged;

  const Textfieldpart({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: (value) => onChanged(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.whiteColor),
        filled: true,
        fillColor: AppColors.darkBlue,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.gold, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.gold, width: 2),
        ),
      ),
    );
  }
}