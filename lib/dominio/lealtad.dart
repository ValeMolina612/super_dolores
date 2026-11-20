class Lealtad {
  final _puntos = <String, int>{};
  int puntos(String usuario) => _puntos[usuario] ?? 0;
  void premiar(String usuario, int cantidad) =>
      _puntos[usuario] = puntos(usuario) + cantidad;
}
