import 'package:flutter/material.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

import '../providers/app-settings.providers.dart';

class AppBarInvoiceUp extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AppBarInvoiceUpState createState() => _AppBarInvoiceUpState();

  // you can replace 100 to whatever value you wish to use

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppBarInvoiceUpState extends State<AppBarInvoiceUp> {
  @override
  Widget build(BuildContext context) {
    bool darkTheme = context.watch<AppSettings>().darkTheme;

    ColorsInvoiceUp colors = ColorsInvoiceUp(
      darkTheme,
    );

    return AppBar(
      elevation: 0,
      backgroundColor: colors.white,
      actions: [
        IconButton(
          onPressed: () {
            context.read<AppSettings>().handleChangeDarkTheme();
          },
          icon: Icon(
            darkTheme ? Icons.light_mode : Icons.dark_mode,
            color: colors.grayText,
          ),
        ),
        PopupMenuButton(
            onSelected: (value) {
              // your logic
            },
            icon: Icon(
              Icons.settings,
              color: colors.grayText,
            ),
            itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      context.read<AppSettings>().setLocale('pt');
                      Navigator.pop(context);
                    },
                    child: Row(children: [
                      Text('Português'),
                    ]),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      context.read<AppSettings>().setLocale('en');
                      Navigator.pop(context);
                    },
                    child: Row(children: [
                      Text('Inglês'),
                    ]),
                  ),
                ),
              ];
            }),
      ],
    );
  }
}
