import 'modelos.dart';

class SuperAppServicio {
  final saldos = <String, int>{'ana': 100000, 'luis': 100000, 'marta': 100000};
  final movimientos = <String, List<Movimiento>>{};
  final mensajes = <Mensaje>[];
  final productos = <Producto>[
    Producto('nieve', 'Nieve de garrafa', '🍨', 4500, 12),
    Producto('talavera', 'Taza de talavera', '🏺', 18500, 6),
    Producto('cajeta', 'Cajeta artesanal', '🥛', 9500, 10),
  ];
  final puntos = <String, int>{};
  final usos = <String, Set<String>>{};
  final activos = <String, bool>{
    'chat': true,
    'monedero': true,
    'tienda': true,
    'viajes': true,
    'metricas': true
  };
  final _claves = <String>{};
  final viajes = <Viaje>[];

  int saldo(String usuario) => saldos[usuario] ?? 0;

  void _uso(String usuario, String servicio) {
    usos.putIfAbsent(usuario, () => {}).add(servicio);
    puntos[usuario] = (puntos[usuario] ?? 0) + 10;
  }

  void transferir(String de, String para, int monto, {required String clave}) {
    if (_claves.contains(clave)) return;
    if (monto <= 0) throw ArgumentError('Monto inválido');
    if (de == para || !saldos.containsKey(para))
      throw ArgumentError('Destinatario inválido');
    if (saldo(de) < monto) throw StateError('Saldo insuficiente');
    _claves.add(clave);
    saldos[de] = saldo(de) - monto;
    saldos[para] = saldo(para) + monto;
    movimientos
        .putIfAbsent(de, () => [])
        .insert(0, Movimiento('Envío a $para', -monto, DateTime.now()));
    movimientos
        .putIfAbsent(para, () => [])
        .insert(0, Movimiento('Recibido de $de', monto, DateTime.now()));
    _uso(de, 'pagos');
  }

  void enviarMensaje(String de, String para, String texto) {
    final limpio = texto.trim();
    if (limpio.isEmpty || limpio.length > 1000 || de == para)
      throw ArgumentError('Mensaje inválido');
    mensajes.add(Mensaje(de, para, limpio, DateTime.now()));
    _uso(de, 'chat');
  }

  void enviarDineroEnChat(String de, String para, int monto, String clave) {
    transferir(de, para, monto, clave: clave);
    enviarMensaje(de, para, 'Te envié ${pesos(monto)}');
  }

  void comprar(String usuario, Producto producto) {
    if (producto.existencias <= 0) throw StateError('Sin existencias');
    if (saldo(usuario) < producto.precio)
      throw StateError('Saldo insuficiente');
    saldos[usuario] = saldo(usuario) - producto.precio;
    producto.existencias--;
    movimientos.putIfAbsent(usuario, () => []).insert(
        0,
        Movimiento(
            'Compra: ${producto.nombre}', -producto.precio, DateTime.now()));
    _uso(usuario, 'tienda');
  }

  Viaje pedirViaje(String usuario, String origen, String destino) {
    if (origen == destino) throw ArgumentError('El destino debe ser diferente');
    const costo = 7800;
    final viaje = Viaje('viaje-${viajes.length + 1}', origen, destino, costo);
    viajes.add(viaje);
    _uso(usuario, 'viajes');
    return viaje;
  }

  void avanzarViaje(String usuario, Viaje viaje) {
    switch (viaje.estado) {
      case EstadoViaje.solicitado:
        viaje.estado = EstadoViaje.aceptado;
      case EstadoViaje.aceptado:
        viaje.estado = EstadoViaje.enCurso;
      case EstadoViaje.enCurso:
        if (saldo(usuario) < viaje.costo)
          throw StateError('Saldo insuficiente');
        saldos[usuario] = saldo(usuario) - viaje.costo;
        viaje.estado = EstadoViaje.finalizado;
      default:
        throw StateError('Transición no permitida');
    }
  }
}
