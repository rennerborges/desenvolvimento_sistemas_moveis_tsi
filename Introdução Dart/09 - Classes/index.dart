import 'dart:io';

import 'aluno.dart';
import 'funcionario.dart';

void main() {
  Funcionario f1 = Funcionario("Marcel", "11111111111", 1200);
  f1.nome = "Marcelo";
  f1.salario = 2000;

  print("O nome é ${f1.nome} e o salário ${f1.salario}");

  String json = '{"nome": "Renner", "cpf": "22222222222", "salario": 2500}';
  Funcionario f2 = Funcionario.fromJson(json);

  print("O nome é ${f2.nome} e o salário ${f2.salario}");

  Aluno a1 = Aluno("Gisele", "1234", telefone: "46464");
}
