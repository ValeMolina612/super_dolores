import 'package:flutter/foundation.dart';

class InicioViewModel extends ChangeNotifier {
  String usuario = 'ana';
  int seccion = 0;
  void elegirUsuario(String v) {
    usuario = v;
    notifyListeners();
  }

  void elegirSeccion(int v) {
    seccion = v;
    notifyListeners();
  }
}
