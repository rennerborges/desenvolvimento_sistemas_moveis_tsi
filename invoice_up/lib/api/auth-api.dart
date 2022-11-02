import 'package:flutter/material.dart';
import 'package:invoice_up/interfaces/auth.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

import '../providers/app-settings.providers.dart';
import '../screens/login/login.screen.dart';

class AuthApi {
  BuildContext context;

  AuthApi(this.context);

  verifyToken(String token) {
    if (JwtDecoder.isExpired(token)) {
      logout();
    }
  }

  logout() {
    Provider.of<AppSettings>(context, listen: false).logout();

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen()),
        (Route<dynamic> route) => route is LoginScreen);
  }
}
