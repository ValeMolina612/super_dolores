import 'package:flutter/foundation.dart';
import '../../dominio/super_app.dart';

class MonederoViewModel extends ChangeNotifier {
  final SuperAppServicio app;
  final String usuario;
  MonederoViewModel(this.app, this.usuario);
  int get saldo => app.saldo(usuario);
  void enviar(String para, int monto) {
    app.transferir(usuario, para, monto,
        clave: 'vm-${DateTime.now().microsecondsSinceEpoch}');
    notifyListeners();
  }
}
