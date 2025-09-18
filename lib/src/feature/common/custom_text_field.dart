import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/widgets/typography.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final bool isObscured;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final String? initialValue;
  final int maxLine;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.labelText,
    this.isObscured = false,
    this.onChanged,
    this.validator,
    this.maxLine = 1,
    this.initialValue,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLine,
      initialValue: initialValue,
      obscureText: isObscured,
      style: TextStyleV1.body1.copyWith(
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyleV1.body3.copyWith(color: AppColors.green4),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.green2),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.red),
        ),
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).nextFocus();
      },
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }
}
