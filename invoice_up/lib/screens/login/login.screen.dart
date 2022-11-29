import 'package:flutter/material.dart';
import 'package:invoice_up/components/appBar.dart';
import 'package:invoice_up/components/button.dart';
import 'package:invoice_up/components/input.dart';
import 'package:invoice_up/components/link.dart';
import 'package:invoice_up/components/text.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/api/login.dart';
import 'package:invoice_up/screens/register/register.screen.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app-settings.providers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _preloader = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String? lastUser =
        Provider.of<AppSettings>(context, listen: false).lastUser;

    print('Last user $lastUser');

    if (lastUser != null) {
      _userController.value = TextEditingValue(text: lastUser);
    }
  }

  login() async {
    try {
      setState(() {
        _preloader = true;
      });

      await Login(
        _userController.text.toString(),
        _passwordController.text.toString(),
      ).execute(context);
    } catch (e) {
      SnackBar snackBar =
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red);

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return S.of(context).passwordInvalid;
    } finally {
      setState(() {
        _preloader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return Scaffold(
        appBar: AppBarInvoiceUp(),
        backgroundColor: colors.white,
        body: SingleChildScrollView(
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
              TextInvoiceUp(S.of(context).subtitleLogin),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputInvoiceUp(
                        textCapitalization: TextCapitalization.none,
                        controller: _userController,
                        labelText: 'E-mail',
                        margin: const EdgeInsets.only(top: 20),
                        hintText: 'user@mail.com',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).requiredField;
                          }

                          final emailRule = RegExp(
                              r'^([0-9a-zA-Z]+([_.-]?[0-9a-zA-Z]+)*@[0-9a-zA-Z]+[0-9,a-z,A-Z,.,-]*(.){1}[a-zA-Z]{2,4})+$');

                          if (!emailRule.hasMatch(value)) {
                            return S.of(context).invalidEmail;
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LinkInvoiceUp(
                            S.of(context).register,
                            onTap: (_) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                      ButtonInvoiceUp(
                        loading: _preloader,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(S.of(context).enter),
                              const Icon(Icons.login),
                            ]),
                        onPressed: (context) {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
