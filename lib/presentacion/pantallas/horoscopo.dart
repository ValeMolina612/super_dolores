import 'package:flutter/material.dart';
import '../../dominio/contexto.dart';
import '../../dominio/mini_app.dart';

class PantallaHoroscopo extends StatelessWidget {
  final ContextoMiniApp contexto;
  const PantallaHoroscopo({super.key, required this.contexto});
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('🔮 Horóscopo de tercero')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text('Esta mini-app solo tiene permiso de identidad.'),
        FilledButton(
            onPressed: () {
              String mensaje;
              try {
                contexto.exigir(Permiso.saldo);
                mensaje = 'Acceso permitido';
              } catch (e) {
                mensaje = '🛡️ Acceso bloqueado: $e';
              }
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(mensaje)));
            },
            child: const Text('Intentar leer saldo'))
      ]));
}
