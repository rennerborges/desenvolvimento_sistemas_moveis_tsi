import 'package:flutter/material.dart';
import 'package:invoice_up/components/appBar.dart';
import 'package:invoice_up/components/button.dart';
import 'package:invoice_up/components/input.dart';
import 'package:invoice_up/components/link.dart';
import 'package:invoice_up/components/text.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app-settings.providers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return Scaffold(
        appBar: AppBarInvoiceUp(),
        backgroundColor: colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 140,
                  child: Image(
                    image: AssetImage('images/logoInvoiceUp.png'),
                  ),
                ),
                TextInvoiceUp(
                  S.of(context).titleLogin,
                  textBold: S.of(context).titleBoldLogin,
                  fontSize: 25,
                  onlyFontBold: true,
                ),
                TextInvoiceUp(S.of(context).subtitleRegister),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputInvoiceUp(
                        controller: _userController,
                        labelText: S.of(context).name,
                        margin: const EdgeInsets.only(top: 20),
                        hintText: 'João Silva',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).requiredField;
                          }
                        },
                      ),
                      InputInvoiceUp(
                        controller: _userController,
                        labelText: S.of(context).user,
                        margin: const EdgeInsets.only(top: 20),
                        hintText: 'user@mail.com',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).requiredField;
                          }
                        },
                      ),
                      InputInvoiceUp(
                        controller: _passwordController,
                        labelText: S.of(context).password,
                        isPassword: true,
                        margin: const EdgeInsets.only(top: 20),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).requiredField;
                          }

                          // ignore: unnecessary_string_escapes
                          final passwordRule = RegExp(
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$\!%*?&])[A-Za-z\d@$\!%*?&]{8,}$');

                          if (!passwordRule.hasMatch(value)) {
                            SnackBar snackBar = SnackBar(
                              content: Text(
                                  S.of(context).passowordInvalidDescription),
                              backgroundColor: Colors.red,
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            return S.of(context).passwordInvalid;
                          }
                        },
                      ),
                      ButtonInvoiceUp(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(S.of(context).register),
                              const Icon(Icons.group_add_rounded),
                            ]),
                        onPressed: (context) {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            print('Logar');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
