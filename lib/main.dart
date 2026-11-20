import 'package:flutter/material.dart';
import 'dominio/super_app.dart';
import 'presentacion/inicio.dart';

void main() => runApp(const SuperDoloresApp());

class SuperDoloresApp extends StatelessWidget {
  const SuperDoloresApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Super Dolores',
        theme: ThemeData(
            colorSchemeSeed: const Color(0xff8b1e3f), useMaterial3: true),
        home: Inicio(servicio: SuperAppServicio()),
      );
}
