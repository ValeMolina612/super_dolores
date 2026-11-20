String pesos(int centavos) {
  final signo = centavos < 0 ? '-' : '';
  final valor = centavos.abs();
  final entero = valor ~/ 100;
  final miles = entero
      .toString()
      .replaceAllMapped(RegExp(r'(?<=\d)(?=(\d{3})+$)'), (_) => ',');
  return '$signo\$$miles.${(valor % 100).toString().padLeft(2, '0')}';
}

class Movimiento {
  final String concepto;
  final int monto;
  final DateTime fecha;
  const Movimiento(this.concepto, this.monto, this.fecha);
}

class Mensaje {
  final String de, para, texto;
  final DateTime fecha;
  const Mensaje(this.de, this.para, this.texto, this.fecha);
}

class Producto {
  final String id, nombre, emoji;
  final int precio;
  int existencias;
  Producto(this.id, this.nombre, this.emoji, this.precio, this.existencias);
}

enum EstadoViaje { solicitado, aceptado, enCurso, finalizado, cancelado }

class Viaje {
  final String id, origen, destino;
  final int costo;
  EstadoViaje estado;
  Viaje(this.id, this.origen, this.destino, this.costo)
      : estado = EstadoViaje.solicitado;
}
