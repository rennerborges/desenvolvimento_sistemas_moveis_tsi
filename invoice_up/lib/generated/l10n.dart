// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello,  `
  String get titleLogin {
    return Intl.message(
      'Hello,  ',
      name: 'titleLogin',
      desc: '',
      args: [],
    );
  }

  /// `you are welcome!`
  String get titleBoldLogin {
    return Intl.message(
      'you are welcome!',
      name: 'titleBoldLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please login to continue`
  String get subtitleLogin {
    return Intl.message(
      'Please login to continue',
      name: 'subtitleLogin',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get enter {
    return Intl.message(
      'Login',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Required fields`
  String get requiredField {
    return Intl.message(
      'Required fields',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password format`
  String get passwordInvalid {
    return Intl.message(
      'Invalid password format',
      name: 'passwordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `The password must have at least eight characters, at least one uppercase letter, one lowercase letter, one number and one special character`
  String get passowordInvalidDescription {
    return Intl.message(
      'The password must have at least eight characters, at least one uppercase letter, one lowercase letter, one number and one special character',
      name: 'passowordInvalidDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter the data to make your registration`
  String get subtitleRegister {
    return Intl.message(
      'Enter the data to make your registration',
      name: 'subtitleRegister',
      desc: '',
      args: [],
    );
  }

  /// `Products under warranty`
  String get productsUnderWarranty {
    return Intl.message(
      'Products under warranty',
      name: 'productsUnderWarranty',
      desc: '',
      args: [],
    );
  }

  /// `Create invoice`
  String get createInvoice {
    return Intl.message(
      'Create invoice',
      name: 'createInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Your invoices`
  String get yourInvoices {
    return Intl.message(
      'Your invoices',
      name: 'yourInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Warranty`
  String get warranty {
    return Intl.message(
      'Warranty',
      name: 'warranty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid e-mail`
  String get invalidEmail {
    return Intl.message(
      'Invalid e-mail',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Fields with * are requireds`
  String get descriptionRequiredFields {
    return Intl.message(
      'Fields with * are requireds',
      name: 'descriptionRequiredFields',
      desc: '',
      args: [],
    );
  }

  /// `User created successfully!`
  String get userCreated {
    return Intl.message(
      'User created successfully!',
      name: 'userCreated',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the date of purchase first`
  String get requiredDateOfPurchase {
    return Intl.message(
      'Please enter the date of purchase first',
      name: 'requiredDateOfPurchase',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get product {
    return Intl.message(
      'Product',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `Place of purchase`
  String get placeOfPurchase {
    return Intl.message(
      'Place of purchase',
      name: 'placeOfPurchase',
      desc: '',
      args: [],
    );
  }

  /// `Date purchased`
  String get dateOfPurchase {
    return Intl.message(
      'Date purchased',
      name: 'dateOfPurchase',
      desc: '',
      args: [],
    );
  }

  /// `Warranty date`
  String get dateOfWarranty {
    return Intl.message(
      'Warranty date',
      name: 'dateOfWarranty',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Return`
  String get back {
    return Intl.message(
      'Return',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Create your invoice`
  String get descriptionCreateInvoice {
    return Intl.message(
      'Create your invoice',
      name: 'descriptionCreateInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Edit your invoice`
  String get descriptionEditInvoice {
    return Intl.message(
      'Edit your invoice',
      name: 'descriptionEditInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Choose an option:`
  String get chooseAnOption {
    return Intl.message(
      'Choose an option:',
      name: 'chooseAnOption',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Image preview`
  String get imagePreview {
    return Intl.message(
      'Image preview',
      name: 'imagePreview',
      desc: '',
      args: [],
    );
  }

  /// `Attachment`
  String get attachment {
    return Intl.message(
      'Attachment',
      name: 'attachment',
      desc: '',
      args: [],
    );
  }

  /// `Attach image*`
  String get attachImage {
    return Intl.message(
      'Attach image*',
      name: 'attachImage',
      desc: '',
      args: [],
    );
  }

  /// `Image attached*`
  String get attachedImage {
    return Intl.message(
      'Image attached*',
      name: 'attachedImage',
      desc: '',
      args: [],
    );
  }

  /// `Portuguese`
  String get portuguese {
    return Intl.message(
      'Portuguese',
      name: 'portuguese',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get spanish {
    return Intl.message(
      'Spanish',
      name: 'spanish',
      desc: '',
      args: [],
    );
  }

  /// `Invoice created successfully!`
  String get createdInvoiceSuccess {
    return Intl.message(
      'Invoice created successfully!',
      name: 'createdInvoiceSuccess',
      desc: '',
      args: [],
    );
  }

  /// `successfully edited!`
  String get editSuccess {
    return Intl.message(
      'successfully edited!',
      name: 'editSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Add an image`
  String get addImage {
    return Intl.message(
      'Add an image',
      name: 'addImage',
      desc: '',
      args: [],
    );
  }

  /// `Todas as notas ficais`
  String get allInvoices {
    return Intl.message(
      'Todas as notas ficais',
      name: 'allInvoices',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
