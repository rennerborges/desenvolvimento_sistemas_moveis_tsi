import 'dart:io';

void main() {
  // Comando para rodar no terminal
  // dart exercicio2.dart

  print("Digite o valor a ser sacado:");
  String? input = stdin.readLineSync();

  int valor = int.parse(input!);

  Map<String, dynamic> sacar({required int valor}) {
    List<int> notas = [50, 10, 5, 1];

    Map<String, dynamic> result = {};

    int valorRestante = valor;

    for (int nota in notas) {
      int quantity = valorRestante ~/ nota;
      valorRestante -= quantity * nota;
      result[nota.toString()] = quantity;
    }

    return result;
  }

  Map<String, dynamic> result = sacar(valor: valor);

  print(
      "Resultado: ${result["50"]} ${result["10"]} ${result["5"]} ${result["1"]}");
  print('\nResultado mais detalhado:');
  print("Notas de 50: ${result["50"]}");
  print("Notas de 10: ${result["10"]}");
  print("Notas de 5: ${result["5"]}");
  print("Notas de 1: ${result["1"]}");
}
