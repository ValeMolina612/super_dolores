import 'package:flutter/foundation.dart';
import '../../dominio/modelos.dart';
import '../../dominio/super_app.dart';

class TiendaViewModel extends ChangeNotifier {
  final SuperAppServicio app;
  final String usuario;
  TiendaViewModel(this.app, this.usuario);
  List<Producto> get productos => app.productos;
  void comprar(Producto p) {
    app.comprar(usuario, p);
    notifyListeners();
  }
}
