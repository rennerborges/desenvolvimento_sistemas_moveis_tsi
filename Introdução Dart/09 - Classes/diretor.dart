import 'dart:convert';
import 'dart:io';

import 'funcionario.dart';

class Diretor extends Funcionario {
  late String? setor;

  Diretor(String nome, String cpf, double salario, String setor)
      : super(nome, cpf, salario) {
    this.setor = setor;
  }

  Diretor.fromJson(String json) : super.fromJson(json) {
    Map<String, dynamic> data = jsonDecode(json);
    this.setor = data['setor'];
  }
}
