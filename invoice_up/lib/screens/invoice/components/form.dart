import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_up/components/button.dart';
import 'package:invoice_up/components/input.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/providers/app-settings.providers.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:provider/provider.dart';

class FormInvoiceScreen extends StatefulWidget {
  const FormInvoiceScreen({super.key});

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
        _warrancyController.value =
            TextEditingValue(text: DateFormat.yMd().format(picked));
      });
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
              controller: _titleController,
              labelText: 'Título',
              margin: const EdgeInsets.only(top: 20),
              hintText: 'Xbox one',
              validator: (value) {
                if (value!.isEmpty) {
                  return S.of(context).requiredField;
                }
              },
            ),
            InputInvoiceUp(
              controller: _localeController,
              labelText: 'Local da compra',
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
                          readOnly: true,
                          controller: _dateController,
                          labelText: 'Data compra',
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
                    onTap: () {
                      _selectWarrancy(context);
                    },
                    child: AbsorbPointer(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: InputInvoiceUp(
                          controller: _warrancyController,
                          labelText: 'Data garantia',
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
              ],
            ),
            InputInvoiceUp(
              controller: _priceController,
              labelText: 'Valor',
              margin: const EdgeInsets.only(top: 20),
              validator: (value) {
                if (value!.isEmpty) {
                  return S.of(context).requiredField;
                }
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonInvoiceUp(
                      margin: const EdgeInsets.only(right: 5),
                      backgroundColor: colors.red100,
                      onPressed: (context) {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          print('Voltar');
                        }
                      },
                      child: Text(
                        'Voltar',
                        style: TextStyle(color: colors.grayText),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ButtonInvoiceUp(
                      margin: const EdgeInsets.only(left: 5),
                      backgroundColor: colors.green100,
                      child: Text(
                        'Criar',
                        style: TextStyle(color: colors.grayText),
                      ),
                      onPressed: (context) {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          print('Logar');
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
