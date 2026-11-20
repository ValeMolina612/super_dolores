enum Permiso { identidad, saldo, pagos, mensajes, comercio, viajes }

class MiniApp {
  final String id, nombre;
  final Set<Permiso> permisos;
  bool activa;
  MiniApp(this.id, this.nombre, this.permisos, {this.activa = true});
}
