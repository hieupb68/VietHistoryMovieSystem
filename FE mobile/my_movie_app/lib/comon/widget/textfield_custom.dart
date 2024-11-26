import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextStyle? textStyle;
  final EdgeInsets contentPadding;
  final OutlineInputBorder borderStyle;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    this.hintText = '',
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.borderStyle = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.grey),
    ),
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: widget.contentPadding,
        border: widget.borderStyle,
        enabledBorder: widget.borderStyle,
        focusedBorder: widget.borderStyle.copyWith(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        )
            : null,
      ),
        style: widget.textStyle ?? const TextStyle(fontSize: 14),
    );
  }
}
