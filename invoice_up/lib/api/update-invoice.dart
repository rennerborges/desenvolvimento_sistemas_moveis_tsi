// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:invoice_up/api/auth-api.dart';
import 'package:invoice_up/api/invoice-up-api.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/interfaces/invoice.dart';
import 'package:invoice_up/screens/home/home.screen.dart';

class UpdateInvoiceApi extends AuthApi {
  late Invoice invoice;

  UpdateInvoiceApi(this.invoice, {required BuildContext context})
      : super(context);

  Future<bool?> execute() async {
    Uri url = Uri.parse("${ApiInvoiceUp.baseUrl}/invoice/${invoice.id}");

    final response = await http.patch(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "token": getToken().token,
      },
      body: json.encode(invoice.toJson()),
    );

    if (response.statusCode == 401) {
      super.logout();
      throw S.of(context).logoutMessage;
    }

    if (response.statusCode == 400) {
      Map data = json.decode(response.body != '' ? response.body : '{}');
      throw data['response']['message'];
    }

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen()),
        (Route<dynamic> route) => route is HomeScreen);

    SnackBar snackBar = SnackBar(
      content: Text('${invoice.title} ${S.of(context).editSuccess}'),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    return true;
  }
}
