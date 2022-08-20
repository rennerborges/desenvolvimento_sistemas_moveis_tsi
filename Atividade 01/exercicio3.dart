import 'dart:io';

void main() {
  // Comando para rodar no terminal
  // dart exercicio3.dart

  int number = 0;

  Map<String, dynamic> object = {
    "maior": null,
    "menor": null,
    "quantidade": 0,
    "soma": 0,
  };

  do {
    print("Digite um número:");
    String? input = stdin.readLineSync();
    number = int.parse(input!);

    if (number == -1) {
      object["media"] = object["soma"] / object["quantidade"];
      break;
    }

    object["quantidade"] += 1;
    object["soma"] += number;

    if (object["maior"] == null) {
      object["maior"] = number;
      object["menor"] = number;
      continue;
    }

    if (number >= object["maior"]) {
      object["maior"] = number;
    }

    if (number <= object["menor"]) {
      object["menor"] = number;
    }
  } while (number != -1);

  print(object);
}
