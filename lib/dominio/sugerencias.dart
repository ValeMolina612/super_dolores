class Sugerencia {
  final String titulo, detalle;
  const Sugerencia(this.titulo, this.detalle);
}

Sugerencia sugerirSegundoServicio(Set<String> usados) => usados.length < 2
    ? const Sugerencia('Descubre otro servicio', 'Prueba Chat, Tienda o Viajes')
    : const Sugerencia('¡Muy bien!', 'Ya usas varios servicios');
