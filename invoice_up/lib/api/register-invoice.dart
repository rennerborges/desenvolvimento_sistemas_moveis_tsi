// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:invoice_up/api/auth-api.dart';
import 'package:invoice_up/api/invoice-up-api.dart';
import 'package:invoice_up/interfaces/auth.dart';
import 'package:invoice_up/interfaces/invoice.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/screens/home/home.screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class RegisterInvoice extends AuthApi {
  late Invoice invoice;

  RegisterInvoice(this.invoice, {required BuildContext context})
      : super(context);

  Future<bool?> execute() async {
    Uri url = Uri.parse("${ApiInvoiceUp.baseUrl}/invoice");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: json.encode(invoice.toJson()),
    );

    Map data = json.decode(response.body);

    print(json.decode(response.body).toString());

    if (response.statusCode == 401) {
      super.logout();
      throw data['message'];
    }

    if (response.statusCode == 400) {
      throw data['response']['message'];
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );

    SnackBar snackBar = SnackBar(
      content: Text('Nota fiscal criada com sucesso!'),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    return true;
  }
}
