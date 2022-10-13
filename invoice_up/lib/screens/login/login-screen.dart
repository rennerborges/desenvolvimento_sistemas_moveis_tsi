import 'package:flutter/material.dart';
import 'package:invoice_up/components/input.dart';
import 'package:invoice_up/components/text.dart';
import 'package:invoice_up/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 140,
              child: Image(
                image: AssetImage('images/logoInvoiceUp.png'),
              ),
            ),
            TextInvoiceUp(
              'Olá, ',
              textBold: 'seja bem vindo!',
              fontSize: 25,
              onlyFontBold: true,
            ),
            TextInvoiceUp('Realize seu login para continuar'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputInvoiceUp(
                        controller: _userController,
                        labelText: 'Usuário',
                        margin: const EdgeInsets.only(top: 20),
                      ),
                      InputInvoiceUp(
                        controller: _passwordController,
                        labelText: 'Senha',
                        isPassword: true,
                        margin: const EdgeInsets.only(top: 20),
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}
