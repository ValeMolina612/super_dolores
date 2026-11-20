import 'package:flutter/foundation.dart';
import '../../dominio/super_app.dart';

class ChatViewModel extends ChangeNotifier {
  final SuperAppServicio app;
  final String usuario;
  ChatViewModel(this.app, this.usuario);
  void enviar(String para, String texto) {
    app.enviarMensaje(usuario, para, texto);
    notifyListeners();
  }
}
