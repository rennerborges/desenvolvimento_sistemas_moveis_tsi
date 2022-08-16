void main() {
  // Básicos

  String nome = "Renner";

  int idade = 20;

  var sobrenome;

  sobrenome = "Borges";

  // Números

  int x = 10;
  double y = 10.0;

  // Constantes

  const telefone = "456464";
  final String email = "email@email.com";

  //Boleanos

  bool logged = false;

  // Dinâmicos

  dynamic aceitaTudo = true;
  aceitaTudo = "aceitaTudo";
  aceitaTudo = 10;

  print("Nome: ${nome.toUpperCase()} - Idade $idade");
}
