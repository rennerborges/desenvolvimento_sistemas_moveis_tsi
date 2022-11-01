import 'package:flutter/material.dart';
import 'package:invoice_up/components/text.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class ContainerTourGuide extends StatefulWidget {
  late String title;
  late String description;

  ContainerTourGuide({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  State<ContainerTourGuide> createState() => _ContainerTourGuideState();
}

class _ContainerTourGuideState extends State<ContainerTourGuide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextInvoiceUp(
            widget.title,
            onlyFontBold: true,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TextInvoiceUp(
              widget.description,
              color: Colors.white,
              fontSize: 18,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
