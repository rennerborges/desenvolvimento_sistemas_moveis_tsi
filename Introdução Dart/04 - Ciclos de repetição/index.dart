void main() {
  List<int> lista = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  List<int> listaMap = lista.map((numero) => numero * 2).toList();

  print("Lista: $lista");
  print("ListaMap: $listaMap");

  int listaReduce = lista.reduce((value, element) => value + element);
  print("ListaReduce: $listaReduce");

  List<int> listaFilter = lista.where((numero) => numero.isEven).toList();
  print("ListaFilter: $listaFilter");
}
