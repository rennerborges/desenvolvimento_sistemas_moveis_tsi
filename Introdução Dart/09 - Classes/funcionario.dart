import 'dart:convert';

class Funcionario {
  late String nome;
  late String cpf;
  late double _salario;

  Funcionario(this.nome, this.cpf, this._salario);

  Funcionario.fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);

    this.nome = data['nome'];
    this.cpf = data['cpf'];
    this._salario = data['salario'].toDouble();
  }

  double get salario {
    return this._salario;
  }

  set salario(double salario) {
    if (!salario.isNegative) {
      this._salario = salario;
    }
  }
}
