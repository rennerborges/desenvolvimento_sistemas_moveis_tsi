import 'package:flutter/material.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

import '../providers/app-settings.providers.dart';

class InputInvoiceUp extends StatefulWidget {
  TextEditingController controller;
  String labelText;
  String? Function(String?)? validator;
  String? Function(String?)? onChanged;
  EdgeInsets? margin;
  TextInputType? type;
  bool isPassword = false;
  String prefixText = '';
  IconData? prefixIcon;
  IconData? suffixIcon;
  String? hintText;
  bool readOnly = false;
  TextCapitalization? textCapitalization;

  InputInvoiceUp({
    required this.controller,
    required this.labelText,
    this.validator,
    this.onChanged,
    this.margin,
    this.type,
    this.isPassword = false,
    this.prefixText = '',
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.textCapitalization,
    super.key,
  });

  @override
  State<InputInvoiceUp> createState() => _InputInvoiceUpState();
}

class _InputInvoiceUpState extends State<InputInvoiceUp> {
  bool showPassword = false;

  GestureDetector setIconPassword(ColorsInvoiceUp colors) {
    return GestureDetector(
      child: Icon(
        showPassword ? Icons.visibility_off : Icons.visibility,
        color: colors.grayText,
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

  TextCapitalization getTextCapitalization() {
    if (widget.isPassword) {
      return TextCapitalization.none;
    }

    return widget.textCapitalization ?? TextCapitalization.sentences;
  }

  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return Container(
      margin: widget.margin ?? const EdgeInsets.all(0),
      child: TextFormField(
        readOnly: widget.readOnly,
        style: TextStyle(color: colors.grayTextBold),
        textCapitalization: getTextCapitalization(),
        controller: widget.controller,
        keyboardType: widget.type ?? TextInputType.text,
        obscureText: setObscureText(),
        enableSuggestions: !widget.isPassword,
        autocorrect: !widget.isPassword,
        decoration: InputDecoration(
          hintText: widget.hintText != null ? 'Ex.: ${widget.hintText}' : null,
          hintStyle: TextStyle(color: colors.grayHint),
          prefixText: widget.prefixText,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  color: colors.grayText,
                )
              : null,
          suffixIcon: widget.isPassword
              ? setIconPassword(colors)
              : Icon(
                  widget.suffixIcon,
                  color: colors.grayText,
                ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: colors.grayText,
            fontSize: 18,
          ),
          floatingLabelStyle: TextStyle(
            color: colors.grayText,
            fontSize: 18,
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          focusColor: Colors.blue,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1,
              color: colors.grayText,
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
