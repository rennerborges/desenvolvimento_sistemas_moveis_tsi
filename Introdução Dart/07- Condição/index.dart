void main() {
  String nome = "Renner";
  if (nome == "Renner") {
    print("Bem vindo!");
  } else {
    print("Autorização negada!");
  }

  String resultado = nome == "Renner" ? "Verdadeiro" : "Falso";
  print("Resultado ${resultado}");
}
