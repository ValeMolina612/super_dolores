import 'excepciones.dart';
import 'mini_app.dart';
import 'super_app.dart';

class ContextoMiniApp {
  final MiniApp miniApp;
  final String usuarioId;
  final SuperAppServicio plataforma;
  ContextoMiniApp(this.miniApp, this.usuarioId, this.plataforma);
  void exigir(Permiso permiso) {
    if (!miniApp.activa) throw const MiniAppNoDisponibleException();
    if (!miniApp.permisos.contains(permiso))
      throw const PermisoDenegadoException();
  }
}
