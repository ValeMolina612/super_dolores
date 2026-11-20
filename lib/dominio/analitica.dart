class Analitica {
  final _usos = <String, Set<String>>{};
  void registrar(String usuario, String servicio) =>
      _usos.putIfAbsent(usuario, () => {}).add(servicio);
  int get dau => _usos.length;
  int get multiservicio => _usos.values.where((x) => x.length >= 2).length;
}
