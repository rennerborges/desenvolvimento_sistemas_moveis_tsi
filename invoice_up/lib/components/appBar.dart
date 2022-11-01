import 'package:flutter/material.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/interfaces/auth.dart';
import 'package:invoice_up/screens/login/login.screen.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

import '../providers/app-settings.providers.dart';

class AppBarInvoiceUp extends StatefulWidget implements PreferredSizeWidget {
  bool forceDarkTheme = false;
  bool disabledActions = false;
  String? title;

  AppBarInvoiceUp({
    this.forceDarkTheme = false,
    this.disabledActions = false,
    this.title,
  });

  @override
  _AppBarInvoiceUpState createState() => _AppBarInvoiceUpState();

  // you can replace 100 to whatever value you wish to use

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppBarInvoiceUpState extends State<AppBarInvoiceUp> {
  logout() {
    Provider.of<AppSettings>(context, listen: false).logout();

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen()),
        (Route<dynamic> route) => route is LoginScreen);
  }

  @override
  Widget build(BuildContext context) {
    Auth? auth = Provider.of<AppSettings>(context).getAuth();
    bool darkTheme = context.watch<AppSettings>().darkTheme;

    ColorsInvoiceUp colors = ColorsInvoiceUp(
      widget.forceDarkTheme || darkTheme,
    );

    return AppBar(
      iconTheme: IconThemeData(
        color: colors.grayText, //change your color here
      ),
      elevation: 0,
      title: widget.title != null ? Text(widget.title!) : null,
      centerTitle: true,
      backgroundColor: colors.white,
      actions: widget.disabledActions
          ? []
          : [
              IconButton(
                onPressed: () {
                  Provider.of<AppSettings>(context, listen: false)
                      .handleChangeDarkTheme();
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
                    Icons.language,
                    color: colors.grayText,
                  ),
                  itemBuilder: (BuildContext bc) {
                    return [
                      PopupMenuItem(
                        onTap: () {
                          context.read<AppSettings>().setLocale('pt');
                        },
                        child: Row(children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 32,
                            child: const Image(
                              image: AssetImage('images/pt.png'),
                            ),
                          ),
                          Text(S.of(context).portuguese),
                        ]),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          context.read<AppSettings>().setLocale('en');
                        },
                        child: Row(children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 32,
                            child: const Image(
                              image: AssetImage('images/en.png'),
                            ),
                          ),
                          Text(S.of(context).english),
                        ]),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          context.read<AppSettings>().setLocale('es');
                        },
                        child: Row(children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 32,
                            child: const Image(
                              image: AssetImage('images/es.png'),
                            ),
                          ),
                          Text(S.of(context).spanish),
                        ]),
                      ),
                    ];
                  }),
              auth != null
                  ? IconButton(
                      onPressed: () {
                        logout();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: colors.grayText,
                      ),
                    )
                  : const SizedBox(),
            ],
    );
  }
}
