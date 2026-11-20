import 'package:flutter_test/flutter_test.dart';
import 'package:super_dolores/dominio/analitica.dart';
import 'package:super_dolores/dominio/lealtad.dart';
import 'package:super_dolores/dominio/notificaciones.dart';
import 'package:super_dolores/dominio/sugerencias.dart';

void main() {
  test('Ronda 9: lealtad acumula puntos', () {
    final l = Lealtad()
      ..premiar('ana', 10)
      ..premiar('ana', 20);
    expect(l.puntos('ana'), 30);
  });
  test('Ronda 10: notificaciones se separan por usuario', () {
    final n = Notificaciones()
      ..enviar('ana', const Notificacion('Hola', 'Mundo'));
    expect(n.de('ana').single.titulo, 'Hola');
    expect(n.de('luis'), isEmpty);
  });
  test('Ronda 11: analítica cuenta multiservicio', () {
    final a = Analitica()
      ..registrar('ana', 'chat')
      ..registrar('ana', 'pagos')
      ..registrar('luis', 'chat');
    expect(a.dau, 2);
    expect(a.multiservicio, 1);
  });
  test('Ronda 12: sugerencia promueve un segundo servicio', () {
    expect(sugerirSegundoServicio({'chat'}).titulo, contains('otro'));
  });
  test('Ronda 14: no insiste cuando ya hay uso multiservicio', () {
    expect(sugerirSegundoServicio({'chat', 'tienda'}).titulo, '¡Muy bien!');
  });
  test('Ronda 15: las métricas usan datos agregados, no mensajes', () {
    final a = Analitica()..registrar('ana', 'chat');
    expect(a.dau, 1);
  });
}
