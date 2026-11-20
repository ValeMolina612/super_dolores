import 'package:flutter_test/flutter_test.dart';
import 'package:super_dolores/dominio/super_app.dart';
import 'package:super_dolores/presentacion/vm/chat_vm.dart';
import 'package:super_dolores/presentacion/vm/monedero_vm.dart';
import 'package:super_dolores/presentacion/vm/tienda_vm.dart';
import 'package:super_dolores/presentacion/vm/viajes_vm.dart';

void main() {
  test('Ronda 13: ChatViewModel envía', () {
    final app = SuperAppServicio();
    ChatViewModel(app, 'ana').enviar('luis', 'Hola');
    expect(app.mensajes.single.texto, 'Hola');
  });
  test('Ronda 13: MonederoViewModel transfiere', () {
    final app = SuperAppServicio();
    MonederoViewModel(app, 'ana').enviar('luis', 1000);
    expect(app.saldo('luis'), 101000);
  });
  test('Ronda 13: TiendaViewModel compra', () {
    final app = SuperAppServicio();
    TiendaViewModel(app, 'ana').comprar(app.productos.first);
    expect(app.productos.first.existencias, 11);
  });
  test('Ronda 13: ViajesViewModel avanza', () {
    final app = SuperAppServicio();
    final vm = ViajesViewModel(app, 'ana')
      ..solicitar('Jardín', 'Museo')
      ..avanzar();
    expect(vm.actual!.estado.name, 'aceptado');
  });
}
