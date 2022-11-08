import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_up/api/delete-invoice.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/interfaces/invoice.dart';
import 'package:invoice_up/screens/home/components/list-item/list-item-skeleton.dart';
import 'package:invoice_up/screens/invoice/invoice-screen.dart';
import 'package:invoice_up/screens/photo-view/photo-view.dart';
import 'package:invoice_up/screens/register/register.screen.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../../../../interfaces/auth.dart';
import '../../../../providers/app-settings.providers.dart';

class ListItem extends StatefulWidget {
  bool loading = false;
  Invoice? invoice;

  ListItem({
    this.invoice,
    this.loading = false,
    super.key,
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  deleteInvoice() async {
    try {
      Auth? auth = Provider.of<AppSettings>(context, listen: false).getAuth();
      if (widget.invoice == null) return;

      await DeleteInvoiceApi(widget.invoice!, context: context).execute();
    } catch (e) {
      SnackBar snackBar =
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red);

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return GestureDetector(
      onLongPress: () {
        if (widget.loading) {
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoViewInvoiceUp(widget.invoice!.image),
          ),
        );
      },
      onTap: () async {
        if (widget.loading) {
          return;
        }

        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InvoiceScreen(invoice: widget.invoice),
          ),
        );
      },
      child: !widget.loading
          ? Dismissible(
              key: Key(widget.invoice!.id!),
              background: Container(
                color: Colors.orange,
                child: const Align(
                  alignment: Alignment(-0.9, 0.0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: const Align(
                  alignment: Alignment(0.9, 0.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              confirmDismiss: ((direction) async {
                if (direction == DismissDirection.startToEnd) {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InvoiceScreen(invoice: widget.invoice),
                    ),
                  );
                }
                if (direction == DismissDirection.endToStart) {
                  deleteInvoice();
                  return true;
                }
              }),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: colors.grayHint),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            widget.invoice!.title,
                            style: TextStyle(
                              color: colors.grayTextBold,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          '${S.of(context).date}: ${formatDate(widget.invoice!.dateOfPurchase)}',
                          style: TextStyle(
                            color: colors.grayText,
                          ),
                        ),
                        widget.invoice!.dateOfWarranty != null
                            ? Text(
                                '${S.of(context).warranty}: ${formatDate(widget.invoice!.dateOfWarranty!)}',
                                style: TextStyle(
                                  color: colors.grayText,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    widget.invoice!.isWarranty
                        ? Icon(
                            Icons.shield,
                            color: colors.blueMain,
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            )
          : Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: colors.grayHint),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: ListItemSkeleton(),
            ),
    );
  }

  String formatDate(String date) {
    DateTime parse = DateTime.parse(date);

    return DateFormat.yMd().format(parse);
  }
}
