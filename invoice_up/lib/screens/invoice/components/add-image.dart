import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_up/components/text.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/screens/photo-view/photo-view.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class AddImage extends StatefulWidget {
  String? image;
  void Function(String?) onChanged;

  AddImage({this.image, required this.onChanged, super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  final ImagePicker _picker = ImagePicker();
  String? _photo;

  decodedImage() {
    return base64Decode(_photo!);
  }

  setPhoto(XFile? photo) {
    if (photo == null) return;

    File image = File(photo.path);
    List<int> imageBytes = image.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    print(base64Image);

    widget.onChanged(base64Image);

    setState(() {
      _photo = base64Image;
    });
  }

  getImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setPhoto(photo);
  }

  getGalery() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    setPhoto(photo);
  }

  openOptions(BuildContext context, ColorsInvoiceUp colors) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(color: colors.white),
            padding: const EdgeInsets.all(20),
            height: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInvoiceUp('', textBold: S.of(context).chooseAnOption),
                ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                    color: colors.grayText,
                  ),
                  title: Text(
                    S.of(context).camera,
                    style: TextStyle(color: colors.grayText),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    getImage();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.photo,
                    color: colors.grayText,
                  ),
                  title: Text(
                    S.of(context).gallery,
                    style: TextStyle(color: colors.grayText),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    getGalery();
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.keyboard_backspace, color: Colors.red),
                  title: Text(
                    S.of(context).back,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return GestureDetector(
      onLongPress: () => {
        if (_photo != null)
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhotoViewInvoiceUp(_photo!)),
            )
          }
      },
      onTap: () {
        openOptions(context, colors);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 20),
        height: _photo != null ? 280 : 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.blue300,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.image, color: Colors.grey[800]),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    _photo == null
                        ? S.of(context).attachImage
                        : S.of(context).attachedImage,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            _photo != null
                ? Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 150,
                    height: 200,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.memory(
                          decodedImage(),
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
