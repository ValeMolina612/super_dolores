import 'super_app.dart';

class Monedero {
  final SuperAppServicio plataforma;
  Monedero(this.plataforma);
  int saldo(String usuario) => plataforma.saldo(usuario);
  void transferir(String de, String para, int monto, String clave) =>
      plataforma.transferir(de, para, monto, clave: clave);
}
