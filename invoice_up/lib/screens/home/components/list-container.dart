import 'package:flutter/material.dart';
import 'package:invoice_up/components/text.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

class ListContainerInvoiceUp extends StatefulWidget {
  const ListContainerInvoiceUp({super.key});

  @override
  State<ListContainerInvoiceUp> createState() => _ListContainerInvoiceUpState();
}

class _ListContainerInvoiceUpState extends State<ListContainerInvoiceUp> {
  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextInvoiceUp('', textBold: S.of(context).yourInvoices),
          SizedBox(
            height: MediaQuery.of(context).size.height - 340,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, position) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.grayHint),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
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
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
