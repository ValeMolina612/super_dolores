export 'modelos.dart' show Mensaje;
import 'super_app.dart';

class ServicioMensajeria {
  final SuperAppServicio app;
  ServicioMensajeria(this.app);
  void enviar(String de, String para, String texto) =>
      app.enviarMensaje(de, para, texto);
}
