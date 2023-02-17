import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      required this.obsureText,
      required this.keyboardType,
      this.icon,
      this.callback,
      required this.isSuffix,
      // required this.errorText,
      required this.validator});

  final TextEditingController controller;
  final String label;
  final bool obsureText;
  final TextInputType keyboardType;
  final Icon? icon;
  final void Function()? callback;
  final bool isSuffix;
  // final String errorText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsureText,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: label,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)),
        suffix: isSuffix
            ? InkWell(
                onTap: callback,
                child: icon,
              )
            : null,
        // errorText: isValid ? errorText : null,
      ),
    );
  }
}
