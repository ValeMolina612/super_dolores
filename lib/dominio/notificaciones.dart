class Notificacion {
  final String titulo, cuerpo;
  const Notificacion(this.titulo, this.cuerpo);
}

class Notificaciones {
  final _datos = <String, List<Notificacion>>{};
  void enviar(String usuario, Notificacion n) =>
      _datos.putIfAbsent(usuario, () => []).add(n);
  List<Notificacion> de(String usuario) =>
      List.unmodifiable(_datos[usuario] ?? const []);
}
