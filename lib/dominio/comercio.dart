export 'modelos.dart' show Producto;
import 'modelos.dart';
import 'super_app.dart';

class ServicioComercio {
  final SuperAppServicio app;
  ServicioComercio(this.app);
  void comprar(String usuario, Producto producto) =>
      app.comprar(usuario, producto);
}
