import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

import '../providers/app-settings.providers.dart';

// ignore: must_be_immutable
class TextInvoiceUp extends StatefulWidget {
  late String text;
  String? textBold;
  MainAxisAlignment? mainAxisAlignment;
  double? fontSize;
  bool onlyFontBold = false;
  TextAlign? textAlign;
  Color? color;
  Color? colorBold;

  TextInvoiceUp(
    this.text, {
    super.key,
    this.textBold = '',
    this.mainAxisAlignment,
    this.fontSize,
    this.textAlign,
    this.onlyFontBold = false,
    this.color,
    this.colorBold,
  });

  @override
  State<TextInvoiceUp> createState() => _TextInvoiceUpState();
}

class _TextInvoiceUpState extends State<TextInvoiceUp> {
  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return Wrap(
      direction: Axis.horizontal,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: widget.color ?? colors.grayText,
            fontSize: widget.fontSize ?? 20,
            fontWeight:
                widget.onlyFontBold ? FontWeight.bold : FontWeight.normal,
          ),
          textAlign: widget.textAlign ?? TextAlign.center,
        ),
        Text(
          widget.textBold!,
          style: TextStyle(
            color: widget.colorBold ?? colors.grayTextBold,
            fontSize: widget.fontSize ?? 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: widget.textAlign ?? TextAlign.center,
        ),
      ],
    );
  }
}
