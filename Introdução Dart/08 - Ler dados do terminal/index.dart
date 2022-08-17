import 'dart:io';

void main() {
  // Comando para rodar no terminal
  // dart index.dart

  print("Digite seu nome:");
  var input = stdin.readLineSync();
  print("Olá $input");

  print("Digite sua idade:");
  String? inputIdade = stdin.readLineSync();
  int idade = int.parse(inputIdade!);
  print("Idade: $idade");
}
