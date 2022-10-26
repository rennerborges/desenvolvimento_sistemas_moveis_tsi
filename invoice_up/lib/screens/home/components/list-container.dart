import 'package:flutter/material.dart';
import 'package:invoice_up/components/text.dart';

class ListContainerInvoiceUp extends StatefulWidget {
  const ListContainerInvoiceUp({super.key});

  @override
  State<ListContainerInvoiceUp> createState() => _ListContainerInvoiceUpState();
}

class _ListContainerInvoiceUpState extends State<ListContainerInvoiceUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(children: [
        TextInvoiceUp('', textBold: 'Suas notas fiscais'),
      ]),
    );
  }
}
