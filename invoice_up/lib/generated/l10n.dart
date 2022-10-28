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
