// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "enter": MessageLookupByLibrary.simpleMessage("Entrar"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Esqueci a senha"),
        "name": MessageLookupByLibrary.simpleMessage("Nome"),
        "passowordInvalidDescription": MessageLookupByLibrary.simpleMessage(
            "A senha precisa ter no mínimo oito caracteres, pelo menos, uma letra maiúscula, uma letra minúscula, um número e um caractere especial"),
        "password": MessageLookupByLibrary.simpleMessage("Senha"),
        "passwordInvalid":
            MessageLookupByLibrary.simpleMessage("Formato de senha inválido"),
        "register": MessageLookupByLibrary.simpleMessage("Registrar"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("Preenchimento obrigatório"),
        "subtitleLogin": MessageLookupByLibrary.simpleMessage(
            "Realize seu login para continuar"),
        "subtitleRegister": MessageLookupByLibrary.simpleMessage(
            "Informe os dados para realizar seu cadastro"),
        "titleBoldLogin":
            MessageLookupByLibrary.simpleMessage("seja bem vindo!"),
        "titleLogin": MessageLookupByLibrary.simpleMessage("Olá, "),
        "user": MessageLookupByLibrary.simpleMessage("Usuário")
      };
}
