// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:invoice_up/api/auth-api.dart';
import 'package:invoice_up/api/invoice-up-api.dart';
import 'package:invoice_up/interfaces/invoice.dart';

class GetInvoicesUserApi extends AuthApi {
  late Invoice invoice;

  GetInvoicesUserApi({required BuildContext context}) : super(context);

  Future<List<Invoice>?> execute() async {
    Uri url = Uri.parse("${ApiInvoiceUp.baseUrl}/invoice/my");

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "token": getToken().token,
      },
    );

    Map data = json.decode(response.body);

    if (response.statusCode == 401) {
      super.logout();
      throw data['message'];
    }

    if (response.statusCode == 400) {
      throw data['response']['message'];
    }

    List<Invoice> invoices = List.empty(growable: true);

    data['invoices'].forEach((invoice) {
      invoices.add(Invoice.fromJson(invoice));
    });

    return invoices;
  }
}
