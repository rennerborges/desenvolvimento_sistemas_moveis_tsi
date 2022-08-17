void main() {
  double somar(double numero1, double numero2) {
    return (numero1 + numero2);
  }

  double subtrair(double numero1, double numero2) => numero1 - numero2;

  print("O valor da soma ${somar(1, 3)}");
  print("O valor da subtração ${subtrair(4, 1)}");

  // Parâmetros nomeados

  double multiplicar({required double numero1, double numero2 = 0}) =>
      numero1 * numero2;

  print("O valor da multiplicação ${multiplicar(numero1: 2, numero2: 3)}");
}
