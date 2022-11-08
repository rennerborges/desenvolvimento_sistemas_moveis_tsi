import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_up/api/register-invoice.dart';
import 'package:invoice_up/api/update-invoice.dart';
import 'package:invoice_up/components/button.dart';
import 'package:invoice_up/components/input.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/interfaces/auth.dart';
import 'package:invoice_up/interfaces/invoice.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/screens/invoice/components/add-image.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

class FormInvoiceScreen extends StatefulWidget {
  Invoice? invoice;

  FormInvoiceScreen(this.invoice, {super.key});

  @override
  State<FormInvoiceScreen> createState() => _FormInvoiceScreenState();
}

class _FormInvoiceScreenState extends State<FormInvoiceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _localeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _warrancyController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  DateTime dateInvoice = DateTime.now();
  DateTime? dateWarrancy;
  String? image;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateInvoice,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime.now().add(const Duration(
        hours: 1,
      )),
    );
    if (picked != null && picked != dateInvoice) {
      setState(() {
        dateInvoice = picked;
        _dateController.value =
            TextEditingValue(text: DateFormat.yMd().format(picked));
      });
    }
  }

  Future<void> _selectWarrancy(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateInvoice,
      firstDate: dateInvoice,
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != dateInvoice) {
      setState(() {
        dateWarrancy = picked;
        _warrancyController.value =
            TextEditingValue(text: DateFormat.yMd().format(picked));
      });
    }
  }

  String toReal(String money) {
    double preco = double.parse(money);
    return NumberFormat("#,##0.00", "pt_BR").format(preco / 100);
  }

  String formatDate(String date) {
    DateTime parse = DateTime.parse(date);

    return DateFormat.yMd().format(parse);
  }

  bool _preloader = false;

  register() async {
    Auth? auth = Provider.of<AppSettings>(context, listen: false).getAuth();

    try {
      setState(() {
        _preloader = true;
      });

      Invoice invoice = Invoice(
        title: _titleController.text.toString(),
        placeOfPurchase: _localeController.text.toString(),
        dateOfPurchase: dateInvoice.toIso8601String(),
        dateOfWarranty:
            dateWarrancy != null ? dateWarrancy?.toIso8601String() : null,
        price: int.parse(
            _priceController.text.toString().replaceAll(RegExp(r'[.,]'), '')),
        image: image!,
        emailUser: auth!.user,
      );

      await RegisterInvoiceApi(invoice, context: context).execute();
    } catch (e) {
      SnackBar snackBar =
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red);

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      throw e;
    } finally {
      setState(() {
        _preloader = false;
      });
    }
  }

  edit() async {
    Auth? auth = Provider.of<AppSettings>(context, listen: false).getAuth();
    print('Edit');
    try {
      setState(() {
        _preloader = true;
      });

      Invoice invoice = Invoice(
        id: widget.invoice!.id!,
        title: _titleController.text.toString(),
        placeOfPurchase: _localeController.text.toString(),
        dateOfPurchase: dateInvoice.toIso8601String(),
        dateOfWarranty:
            dateWarrancy != null ? dateWarrancy?.toIso8601String() : null,
        price: int.parse(
            _priceController.text.toString().replaceAll(RegExp(r'[.,]'), '')),
        image: image!,
        emailUser: auth!.user,
      );

      await UpdateInvoiceApi(invoice, context: context).execute();
    } catch (e) {
      SnackBar snackBar =
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red);

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      throw e;
    } finally {
      setState(() {
        _preloader = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.invoice != null) {
      _titleController.value = TextEditingValue(text: widget.invoice!.title);
      _localeController.value =
          TextEditingValue(text: widget.invoice!.placeOfPurchase);
      _dateController.value =
          TextEditingValue(text: formatDate(widget.invoice!.dateOfPurchase));
      dateInvoice = DateTime.parse(widget.invoice!.dateOfPurchase);
      _priceController.value =
          TextEditingValue(text: toReal(widget.invoice!.price.toString()));
      image = widget.invoice!.image;

      if (widget.invoice!.dateOfWarranty != null) {
        dateWarrancy = DateTime.parse(widget.invoice!.dateOfWarranty!);
        _warrancyController.value =
            TextEditingValue(text: formatDate(widget.invoice!.dateOfWarranty!));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            InputInvoiceUp(
              required: true,
              controller: _titleController,
              labelText: S.of(context).title,
              margin: const EdgeInsets.only(top: 20),
              hintText: 'Xbox one',
              validator: (value) {
                if (value!.isEmpty) {
                  return S.of(context).requiredField;
                }
              },
            ),
            InputInvoiceUp(
              required: true,
              controller: _localeController,
              labelText: S.of(context).placeOfPurchase,
              hintText: 'Americanas',
              margin: const EdgeInsets.only(top: 20),
              validator: (value) {
                if (value!.isEmpty) {
                  return S.of(context).requiredField;
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: AbsorbPointer(
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: InputInvoiceUp(
                          required: true,
                          readOnly: true,
                          controller: _dateController,
                          labelText: S.of(context).dateOfPurchase,
                          type: TextInputType.datetime,
                          margin: const EdgeInsets.only(top: 20),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return S.of(context).requiredField;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        _warrancyController.clear();
                      });
                    },
                    onTap: () {
                      if (_dateController.text.isEmpty) {
                        SnackBar snackBar = SnackBar(
                            content: Text(S.of(context).requiredDateOfPurchase),
                            backgroundColor: Colors.orange);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

                      _selectWarrancy(context);
                    },
                    child: AbsorbPointer(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: InputInvoiceUp(
                          controller: _warrancyController,
                          labelText: S.of(context).dateOfWarranty,
                          type: TextInputType.datetime,
                          margin: const EdgeInsets.only(top: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InputInvoiceUp(
              required: true,
              controller: _priceController,
              labelText: S.of(context).price,
              margin: const EdgeInsets.only(top: 20),
              type: TextInputType.number,
              prefixText: "R\$: ",
              onChanged: (string) {
                string = toReal(string!.replaceAll(RegExp(r'[.,]'), ''));
                _priceController.value = TextEditingValue(
                  text: string,
                  selection: TextSelection.collapsed(offset: string.length),
                );
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return S.of(context).requiredField;
                }
              },
            ),
            AddImage(
                image: image,
                onChanged: (String? value) {
                  setState(() {
                    image = value;
                  });
                }),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonInvoiceUp(
                      loading: _preloader,
                      margin: const EdgeInsets.only(right: 5),
                      backgroundColor: colors.red100,
                      onPressed: (context) {
                        Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).back,
                        style: TextStyle(color: colors.grayTextBold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ButtonInvoiceUp(
                      loading: _preloader,
                      margin: const EdgeInsets.only(left: 5),
                      backgroundColor: colors.green100,
                      child: Text(
                        widget.invoice != null
                            ? S.of(context).edit
                            : S.of(context).create,
                        style: TextStyle(color: colors.grayTextBold),
                      ),
                      onPressed: (context) {
                        FocusScope.of(context).unfocus();

                        if (image == null) {
                          SnackBar snackBar = SnackBar(
                              content: Text(S.of(context).addImage),
                              backgroundColor: Colors.red);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                        if (_formKey.currentState!.validate()) {
                          print('Logar');

                          if (widget.invoice != null) {
                            edit();
                          } else {
                            register();
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
