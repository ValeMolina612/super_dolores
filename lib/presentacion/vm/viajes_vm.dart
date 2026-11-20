import 'package:flutter/foundation.dart';
import '../../dominio/modelos.dart';
import '../../dominio/super_app.dart';

class ViajesViewModel extends ChangeNotifier {
  final SuperAppServicio app;
  final String usuario;
  Viaje? actual;
  ViajesViewModel(this.app, this.usuario);
  void solicitar(String origen, String destino) {
    actual = app.pedirViaje(usuario, origen, destino);
    notifyListeners();
  }

  void avanzar() {
    app.avanzarViaje(usuario, actual!);
    notifyListeners();
  }
}
