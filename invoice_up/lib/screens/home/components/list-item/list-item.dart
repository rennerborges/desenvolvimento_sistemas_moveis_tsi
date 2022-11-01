import 'package:flutter/material.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/screens/home/components/list-item/list-item-skeleton.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app-settings.providers.dart';

class ListItem extends StatefulWidget {
  bool loading = false;

  ListItem({
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

    return Container(
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
                        'Renner',
                        style: TextStyle(
                          color: colors.grayTextBold,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      '${S.of(context).date}: 23/11/2022',
                      style: TextStyle(
                        color: colors.grayText,
                      ),
                    ),
                    Text(
                      '${S.of(context).warranty}: 23/11/2022',
                      style: TextStyle(
                        color: colors.grayText,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.shield,
                  color: colors.blueMain,
                )
              ],
            )
          : ListItemSkeleton(),
    );
  }
}
