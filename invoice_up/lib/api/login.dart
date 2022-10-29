// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:invoice_up/api/invoice-up-api.dart';
import 'package:invoice_up/interfaces/auth.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/screens/home/home.screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class Login {
  late String user;
  late String password;
  String? token;

  Login(
    this.user,
    this.password,
  );

  Future<bool?> execute(BuildContext context) async {
    Uri url = Uri.parse("${ApiInvoiceUp.baseUrl}/login");

    final response =
        await http.post(url, body: {'email': user, 'password': password});

    Map data = json.decode(response.body);

    if (response.statusCode == 401) {
      throw data['message'];
    }

    String token = data['token'];
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    Auth auth = Auth(
        user: decodedToken['email'], token: token, name: decodedToken['name']);

    context.read<AppSettings>().setAuth(auth);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen()),
        (Route<dynamic> route) => route is HomeScreen);

    return true;
  }
}
