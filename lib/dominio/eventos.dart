typedef Manejador<T> = void Function(T evento);

class BusEventos {
  final _subs = <Type, List<Function>>{};
  void suscribir<T>(Manejador<T> fn) => _subs.putIfAbsent(T, () => []).add(fn);
  void publicar<T>(T evento) {
    for (final fn in _subs[T] ?? const []) {
      try {
        fn(evento);
      } catch (_) {}
    }
  }
}
