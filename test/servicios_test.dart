import 'package:flutter_test/flutter_test.dart';
import 'package:super_dolores/dominio/eventos.dart';
import 'package:super_dolores/dominio/excepciones.dart';
import 'package:super_dolores/dominio/mini_app.dart';
import 'package:super_dolores/dominio/contexto.dart';
import 'package:super_dolores/dominio/super_app.dart';

void main() {
  test('Ronda 6: bus entrega eventos por tipo', () {
    final bus = BusEventos();
    var n = 0;
    bus.suscribir<String>((_) => n++);
    bus.publicar('evento');
    expect(n, 1);
  });
  test('Ronda 7: mini-app aplica menor privilegio', () {
    final app = SuperAppServicio();
    final mini = MiniApp('horoscopo', 'Horóscopo', {Permiso.identidad});
    final ctx = ContextoMiniApp(mini, 'ana', app);
    expect(() => ctx.exigir(Permiso.saldo),
        throwsA(isA<PermisoDenegadoException>()));
  });
  test('Ronda 7: kill switch bloquea mini-app', () {
    final app = SuperAppServicio();
    final mini = MiniApp('chat', 'Chat', {Permiso.mensajes})..activa = false;
    final ctx = ContextoMiniApp(mini, 'ana', app);
    expect(() => ctx.exigir(Permiso.mensajes),
        throwsA(isA<MiniAppNoDisponibleException>()));
  });
  test('Ronda 8: la integración usa una sola identidad', () {
    final app = SuperAppServicio();
    app.enviarDineroEnChat('ana', 'luis', 5000, 'integracion');
    expect(app.usos['ana'], containsAll(['pagos', 'chat']));
  });
}
