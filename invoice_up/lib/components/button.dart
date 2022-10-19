import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app-settings.providers.dart';
import '../utils/colors.dart';

class ButtonInvoiceUp extends StatefulWidget {
  late Widget child;
  Color? backgroundColor;
  void Function(BuildContext context)? onPressed;

  ButtonInvoiceUp({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    super.key,
  });

  @override
  State<ButtonInvoiceUp> createState() => _ButtonInvoiceUpState();
}

class _ButtonInvoiceUpState extends State<ButtonInvoiceUp> {
  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            widget.backgroundColor ?? colors.blueMain,
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {
          widget.onPressed!(context);
        },
        child: widget.child,
      ),
    );
  }
}
