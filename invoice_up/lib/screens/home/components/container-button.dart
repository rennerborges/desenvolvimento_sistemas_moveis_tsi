import 'package:flutter/material.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/screens/invoice/invoice-screen.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:invoice_up/utils/global-keys.dart';
import 'package:provider/provider.dart';

class ContainerButton extends StatefulWidget {
  bool onlyWarranty;
  void Function() getInvoices;
  void Function() changeOnlyWarranty;

  ContainerButton({
    required this.onlyWarranty,
    required this.changeOnlyWarranty,
    required this.getInvoices,
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
            child: GestureDetector(
              onTap: () {
                widget.changeOnlyWarranty();
              },
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
                        key: GlobalKeysInvoiceUp.keyButtonProductsWarrancy,
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.shield, size: 20),
                        ),
                      ),
                      Text(
                        widget.onlyWarranty
                            ? S.of(context).allInvoices
                            : S.of(context).productsUnderWarranty,
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
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InvoiceScreen()),
                );

                widget.getInvoices();
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
                        key: GlobalKeysInvoiceUp.keyButtonCreateInvoices,
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
