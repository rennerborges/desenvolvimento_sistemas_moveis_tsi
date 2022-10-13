import 'package:flutter/material.dart';
import 'package:invoice_up/utils/colors.dart';

class InputInvoiceUp extends StatefulWidget {
  TextEditingController controller;
  String labelText;
  String? Function(String?)? validator;
  String? Function(String?)? onChanged;
  EdgeInsets? margin;
  TextInputType? type;
  bool isPassword = false;
  String prefixText = '';
  Icon? prefixIcon;
  Icon? suffixIcon;

  InputInvoiceUp({
    required this.controller,
    required this.labelText,
    this.validator,
    this.onChanged,
    this.margin,
    this.type,
    this.isPassword = false,
    this.prefixText = '',
    this.prefixIcon,
    this.suffixIcon,
    super.key,
  });

  @override
  State<InputInvoiceUp> createState() => _InputInvoiceUpState();
}

class _InputInvoiceUpState extends State<InputInvoiceUp> {
  bool showPassword = false;

  GestureDetector setIconPassword() {
    return GestureDetector(
      child: Icon(
        showPassword ? Icons.visibility_off : Icons.visibility,
        color: ColorsInvoiceUp.grayText,
      ),
      onTap: () {
        setState(() {
          showPassword = !showPassword;
        });
      },
    );
  }

  bool setObscureText() {
    if (widget.isPassword) {
      return !showPassword;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.all(0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.type ?? TextInputType.text,
        obscureText: setObscureText(),
        enableSuggestions: !widget.isPassword,
        autocorrect: !widget.isPassword,
        decoration: InputDecoration(
          prefixText: widget.prefixText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword ? setIconPassword() : widget.suffixIcon,
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(fontSize: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey[600]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
        ),
        onChanged: (string) {
          if (widget.onChanged != null) {
            widget.onChanged!(string);
          }
        },
        validator: (value) {
          if (widget.validator != null) {
            return widget.validator!(value);
          }
        },
      ),
    );
  }
}
