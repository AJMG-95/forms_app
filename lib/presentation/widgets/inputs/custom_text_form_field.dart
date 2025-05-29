import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscure;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscure = false
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderSide: BorderSide(width: 1.2),
      borderRadius: BorderRadius.circular(40),
    );

    bool isNullOrEmpty(String? value) {
      return value == null || value.trim().isEmpty;
    }

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscure,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800, width: 2),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800, width: 2),
        ),

        isDense: true, // para que no temha demasiada altura
        label:
            !isNullOrEmpty(label)
                ? Text(label!.trim(), style: TextStyle(fontFamily: 'Roboto'))
                : null,
        hintText: hint,
        focusColor: colors.primary,
        errorText: errorMessage,
        prefixIcon: prefixIcon != null ?  Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }
}
