import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app-settings.providers.dart';
import '../utils/colors.dart';

class ButtonInvoiceUp extends StatefulWidget {
  late Widget child;
  Color? backgroundColor;
  Color? color;
  EdgeInsets? margin;
  bool loading = false;

  void Function(BuildContext context)? onPressed;

  ButtonInvoiceUp({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.color,
    this.margin,
    this.loading = false,
    super.key,
  });

  @override
  State<ButtonInvoiceUp> createState() => _ButtonInvoiceUpState();
}

class _ButtonInvoiceUpState extends State<ButtonInvoiceUp> {
  Color getBackgroundColor(ColorsInvoiceUp colors) {
    if (widget.loading) {
      return Colors.grey[400]!;
    }

    return widget.backgroundColor ?? colors.blueMain;
  }

  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return Container(
      width: double.infinity,
      height: 50,
      margin: widget.margin ?? const EdgeInsets.all(0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(getBackgroundColor(colors)),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {
          if (!widget.loading) {
            widget.onPressed!(context);
          }
        },
        child: widget.loading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[400]!,
                  color: Colors.grey[800]!,
                ),
              )
            : widget.child,
      ),
    );
  }
}
