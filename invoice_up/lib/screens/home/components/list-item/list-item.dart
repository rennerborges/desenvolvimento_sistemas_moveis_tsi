import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/interfaces/invoice.dart';
import 'package:invoice_up/screens/home/components/list-item/list-item-skeleton.dart';
import 'package:invoice_up/screens/photo-view/photo-view.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

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
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: colors.grayHint),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: !widget.loading
            ? Row(
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
                          : SizedBox(),
                    ],
                  ),
                  Icon(
                    Icons.shield,
                    color: colors.blueMain,
                  )
                ],
              )
            : ListItemSkeleton(),
      ),
    );
  }

  String formatDate(String date) {
    DateTime parse = DateTime.parse(date);

    return DateFormat.yMd().format(parse);
  }
}
