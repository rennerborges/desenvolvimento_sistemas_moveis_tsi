import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invoice_up/components/appBar.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class PhotoViewInvoiceUp extends StatefulWidget {
  String image;

  PhotoViewInvoiceUp(this.image, {super.key});

  @override
  State<PhotoViewInvoiceUp> createState() => _PhotoViewInvoiceUpState();
}

class _PhotoViewInvoiceUpState extends State<PhotoViewInvoiceUp> {
  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return Scaffold(
      appBar: AppBarInvoiceUp(),
      body: Container(
        child: PhotoView(
          imageProvider: MemoryImage(base64Decode(widget.image)),
          enableRotation: true,
        ),
      ),
    );
  }
}
