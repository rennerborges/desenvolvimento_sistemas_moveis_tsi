import 'package:flutter/material.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/screens/invoice/invoice-screen.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

class ContainerButton extends StatefulWidget {
  GlobalKey? keyWarrancy;
  GlobalKey? keyCreateInvoice;

  ContainerButton({
    this.keyWarrancy,
    this.keyCreateInvoice,
    super.key,
  });

  @override
  State<ContainerButton> createState() => _ContainerButtonState();
}

class _ContainerButtonState extends State<ContainerButton> {
  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 160,
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                color: colors.blueMain,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      key: widget.keyWarrancy,
                      width: 40,
                      height: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.shield, size: 20),
                      ),
                    ),
                    Text(
                      S.of(context).productsUnderWarranty,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InvoiceScreen()),
                );
              },
              child: Container(
                height: 160,
                margin: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: colors.blue300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        key: widget.keyCreateInvoice,
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          backgroundColor: colors.blueMain,
                          child: const Icon(Icons.playlist_add,
                              size: 25, color: Colors.white),
                        ),
                      ),
                      Text(
                        S.of(context).createInvoice,
                        style: TextStyle(
                          color: colors.blueMain,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
