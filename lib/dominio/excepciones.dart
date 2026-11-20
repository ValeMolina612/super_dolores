class SuperDoloresException implements Exception {
  final String mensaje;
  const SuperDoloresException(this.mensaje);
  @override
  String toString() => mensaje;
}

class PermisoDenegadoException extends SuperDoloresException {
  const PermisoDenegadoException() : super('Permiso denegado');
}

class MiniAppNoDisponibleException extends SuperDoloresException {
  const MiniAppNoDisponibleException() : super('Mini-app no disponible');
}
