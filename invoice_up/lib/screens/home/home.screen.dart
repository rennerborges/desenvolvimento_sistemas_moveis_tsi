import 'package:flutter/material.dart';
import 'package:invoice_up/components/appBar.dart';
import 'package:invoice_up/components/text.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/interfaces/auth.dart';
import 'package:invoice_up/screens/home/components/container-button.dart';
import 'package:invoice_up/screens/home/components/list-container.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app-settings.providers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    Auth? auth = Provider.of<AppSettings>(context, listen: false).getAuth();

    return Scaffold(
      appBar: AppBarInvoiceUp(),
      backgroundColor: colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInvoiceUp(
                S.of(context).titleLogin,
                textBold: auth != null ? "${auth.name}!" : '',
              ),
              const ContainerButton(),
              const ListContainerInvoiceUp(),
            ],
          ),
        ),
      ),
    );
  }
}
