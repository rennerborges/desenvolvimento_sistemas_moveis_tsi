import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_up/components/text.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

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

  openOptions(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInvoiceUp('', textBold: "Escolha uma opção:"),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Câmera'),
                  onTap: () async {
                    Navigator.pop(context);
                    getImage();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('Galeria'),
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
                    style: TextStyle(
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
      onTap: () {
        openOptions(context);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 20),
        height: _photo != null ? 280 : 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.blue300,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.image, color: colors.grayTextBold),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    _photo == null ? 'Anexar imagem*' : 'Imagem anexada*',
                    style: TextStyle(
                      color: colors.grayTextBold,
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
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
