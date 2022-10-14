import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:invoice_up/utils/colors.dart';

// ignore: must_be_immutable
class LinkInvoiceUp extends StatefulWidget {
  late String text;

  double? fontSize;
  FontWeight? fontWeight;
  EdgeInsets? margin;
  void Function(BuildContext context)? onTap;

  LinkInvoiceUp(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.margin,
    this.onTap,
  });

  @override
  State<LinkInvoiceUp> createState() => _LinkInvoiceUpState();
}

class _LinkInvoiceUpState extends State<LinkInvoiceUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!(context);
          }
        },
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.blue[500],
            fontSize: widget.fontSize ?? 16,
            fontWeight: widget.fontWeight ?? FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
