import 'package:temry_market/core/constant/config_size.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  Widget? suffix;
  TextInputType inputType;
  bool? obscureText;
  String? hint;
  String? Function(String?)? validator;
  final FocusNode? focusNode;

  CustomTextField(
      {super.key,
      required this.controller,
      this.suffix,
      required this.inputType,
      this.obscureText = false,
      this.hint,
      this.validator,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      validator: validator,
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            EdgeInsets.symmetric(horizontal: ConfigSize.defaultSize!),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFD3D3D3),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFD3D3D3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFD3D3D3),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFD3D3D3),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFD3D3D3),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFD3D3D3),
          ),
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
