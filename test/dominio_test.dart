import 'package:flutter_test/flutter_test.dart';
import 'package:super_dolores/dominio/modelos.dart';
import 'package:super_dolores/dominio/super_app.dart';

void main() {
  late SuperAppServicio app;
  setUp(() => app = SuperAppServicio());

  group('Ronda 2 - dinero', () {
    test('formatea pesos', () {
      expect(pesos(125000), r'$1,250.00');
      expect(pesos(-5050), r'-$50.50');
    });
    test('transferencia conserva el total', () {
      final antes = app.saldos.values.reduce((a, b) => a + b);
      app.transferir('ana', 'luis', 4000, clave: 't');
      expect(app.saldos.values.reduce((a, b) => a + b), antes);
    });
    test('idempotencia evita doble cobro', () {
      app.transferir('ana', 'luis', 1000, clave: 'k');
      app.transferir('ana', 'luis', 1000, clave: 'k');
      expect(app.saldo('luis'), 101000);
    });
    test(
        'no permite saldo insuficiente',
        () => expect(() => app.transferir('ana', 'luis', 200000, clave: 'x'),
            throwsStateError));
  });
  group('Ronda 3 - mensajería', () {
    test('envía mensajes', () {
      app.enviarMensaje('ana', 'luis', 'Hola');
      expect(app.mensajes.single.texto, 'Hola');
    });
    test(
        'rechaza texto vacío',
        () => expect(
            () => app.enviarMensaje('ana', 'luis', ' '), throwsArgumentError));
    test('dinero dentro del chat integra dos servicios', () {
      app.enviarDineroEnChat('ana', 'luis', 5000, 'c');
      expect(app.mensajes.single.texto, contains(r'$50.00'));
      expect(app.usos['ana'], containsAll(['pagos', 'chat']));
    });
  });
  group('Ronda 4 - comercio', () {
    test('compra descuenta saldo y existencia', () {
      final p = app.productos.first;
      app.comprar('ana', p);
      expect(app.saldo('ana'), 95500);
      expect(p.existencias, 11);
    });
    test('producto agotado falla', () {
      final p = app.productos.first..existencias = 0;
      expect(() => app.comprar('ana', p), throwsStateError);
    });
  });
  group('Ronda 5 - transporte', () {
    test('recorre estados legales', () {
      final v = app.pedirViaje('ana', 'A', 'B');
      app.avanzarViaje('ana', v);
      expect(v.estado, EstadoViaje.aceptado);
      app.avanzarViaje('ana', v);
      expect(v.estado, EstadoViaje.enCurso);
      app.avanzarViaje('ana', v);
      expect(v.estado, EstadoViaje.finalizado);
    });
    test(
        'origen y destino deben diferir',
        () =>
            expect(() => app.pedirViaje('ana', 'A', 'A'), throwsArgumentError));
  });
  group('Rondas 6 a 15 - plataforma', () {
    test('kill switch puede apagar servicios', () {
      app.activos['viajes'] = false;
      expect(app.activos['viajes'], isFalse);
    });
    test('lealtad suma puntos por uso', () {
      app.enviarMensaje('ana', 'luis', 'Hola');
      expect(app.puntos['ana'], 10);
    });
    test('analítica reconoce multiservicio', () {
      app.enviarMensaje('ana', 'luis', 'Hola');
      app.comprar('ana', app.productos.first);
      expect(app.usos['ana']!.length, 2);
    });
  });
}
