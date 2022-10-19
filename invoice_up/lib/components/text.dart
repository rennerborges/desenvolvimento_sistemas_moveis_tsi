import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

import '../providers/theme.providers.dart';

// ignore: must_be_immutable
class TextInvoiceUp extends StatefulWidget {
  late String text;
  String? textBold;
  MainAxisAlignment? mainAxisAlignment;
  double? fontSize;
  bool onlyFontBold = false;

  TextInvoiceUp(
    this.text, {
    super.key,
    this.textBold = '',
    this.mainAxisAlignment,
    this.fontSize,
    this.onlyFontBold = false,
  });

  @override
  State<TextInvoiceUp> createState() => _TextInvoiceUpState();
}

class _TextInvoiceUpState extends State<TextInvoiceUp> {
  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<DarkTheme>().darkTheme,
    );

    return Row(
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: colors.grayText,
            fontSize: widget.fontSize ?? 20,
            fontWeight:
                widget.onlyFontBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          widget.textBold!,
          style: TextStyle(
            color: colors.grayTextBold,
            fontSize: widget.fontSize ?? 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
