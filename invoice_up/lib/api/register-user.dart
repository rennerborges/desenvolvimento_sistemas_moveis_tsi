// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:invoice_up/api/invoice-up-api.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/screens/login/login.screen.dart';
import 'package:provider/provider.dart';

class RegisterUserApi {
  late String name;
  late String password;
  late String email;
  String? token;

  RegisterUserApi({
    required this.name,
    required this.email,
    required this.password,
  });

  Future<bool?> execute(BuildContext context) async {
    Uri url = Uri.parse("${ApiInvoiceUp.baseUrl}/user");

    final response = await http.post(url, body: {
      'name': name,
      'email': email,
      'password': password,
    });

    Map data = json.decode(response.body);

    if (response.statusCode == 201) {
      SnackBar snackBar = SnackBar(
        content: Text(S.of(context).userCreated),
        backgroundColor: Colors.green,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Provider.of<AppSettings>(context, listen: false).setLastUser(email);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen()),
          (Route<dynamic> route) => route is LoginScreen);

      return true;
    }

    throw data['response']['message'] ?? data;
  }
}
