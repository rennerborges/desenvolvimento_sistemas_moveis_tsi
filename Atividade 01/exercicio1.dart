import 'dart:io';

void main() {
  // Comando para rodar no terminal
  // dart exercicio1.dart

  print("Digite um número para calcular seu fatorial:");
  String? input = stdin.readLineSync();

  int numero = int.parse(input!);

  int calcFatorial({required int numero}) {
    int result = 1;

    for (int i = 0; i < numero; i++) {
      result *= numero - i;
    }

    return result;
  }

  print("Resultado: ${calcFatorial(numero: numero)}");
}
