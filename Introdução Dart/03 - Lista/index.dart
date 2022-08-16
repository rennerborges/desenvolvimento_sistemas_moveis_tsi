void main() {
  List<int> lista = new List<int>.empty(growable: true);
  lista.add(1);
  lista.add(2);
  lista.add(3);

  print("Lista: $lista");

  List<int> lista2 = [0, ...lista, 4, 5, 6];

  print("Lista2: $lista2");

  lista2.insert(2, 7);

  print("Lista2 depois do insert: $lista2");

  lista2.removeAt(0);
  lista2.removeRange(4, lista2.length);

  print("Lista2 depois de remover: $lista2");
}
