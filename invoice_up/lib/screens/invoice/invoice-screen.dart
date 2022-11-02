import 'package:flutter/material.dart';
import 'package:invoice_up/components/appBar.dart';
import 'package:invoice_up/components/text.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/interfaces/invoice.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/screens/invoice/components/form.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

class InvoiceScreen extends StatefulWidget {
  Invoice? invoice;

  InvoiceScreen({this.invoice, super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
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
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInvoiceUp('',
                  textBold: S.of(context).descriptionCreateInvoice),
              TextInvoiceUp(
                S.of(context).descriptionRequiredFields,
                textAlign: TextAlign.start,
              ),
              FormInvoiceScreen(widget.invoice),
            ],
          ),
        ),
      ),
    );
  }
}
