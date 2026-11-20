import 'package:flutter/material.dart';
import '../dominio/modelos.dart';
import '../dominio/super_app.dart';

class Inicio extends StatefulWidget {
  final SuperAppServicio servicio;
  const Inicio({super.key, required this.servicio});
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  String usuario = 'ana';
  int indice = 0;
  void actualizar() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final paginas = [
      _Resumen(widget.servicio, usuario, actualizar),
      _Chat(widget.servicio, usuario, actualizar),
      _Monedero(widget.servicio, usuario, actualizar),
      _Tienda(widget.servicio, usuario, actualizar),
      _Viajes(widget.servicio, usuario, actualizar),
      _Metricas(widget.servicio),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Dolores'),
        actions: [
          DropdownButton<String>(
              value: usuario,
              items: const [
                DropdownMenuItem(value: 'ana', child: Text('Ana')),
                DropdownMenuItem(value: 'luis', child: Text('Luis')),
                DropdownMenuItem(value: 'marta', child: Text('Marta')),
              ],
              onChanged: (v) => setState(() => usuario = v!)),
          const SizedBox(width: 12)
        ],
      ),
      body: paginas[indice],
      bottomNavigationBar: NavigationBar(
          selectedIndex: indice,
          onDestinationSelected: (v) => setState(() => indice = v),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
            NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
            NavigationDestination(
                icon: Icon(Icons.account_balance_wallet), label: 'Saldo'),
            NavigationDestination(icon: Icon(Icons.store), label: 'Tienda'),
            NavigationDestination(
                icon: Icon(Icons.local_taxi), label: 'Viajes'),
            NavigationDestination(
                icon: Icon(Icons.bar_chart), label: 'Métricas'),
          ]),
    );
  }
}

class _Resumen extends StatelessWidget {
  final SuperAppServicio s;
  final String u;
  final VoidCallback cambio;
  const _Resumen(this.s, this.u, this.cambio);
  @override
  Widget build(BuildContext context) =>
      ListView(padding: const EdgeInsets.all(16), children: [
        Text('Hola, ${u[0].toUpperCase()}${u.substring(1)}',
            style: Theme.of(context).textTheme.headlineMedium),
        Text('Tu plaza digital de Dolores Hidalgo',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        Card(
            child: ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Saldo de práctica'),
                subtitle: Text(pesos(s.saldo(u))),
                trailing: Text('${s.puntos[u] ?? 0} puntos'))),
        const Card(
            child: ListTile(
                leading: Text('🛡️', style: TextStyle(fontSize: 28)),
                title: Text('Servicios simulados'),
                subtitle: Text(
                    'No mueve dinero real ni comparte datos personales.'))),
        const SizedBox(height: 12),
        Text('Interruptores de emergencia',
            style: Theme.of(context).textTheme.titleLarge),
        for (final e in s.activos.entries)
          SwitchListTile(
              title: Text(e.key),
              value: e.value,
              onChanged: (v) {
                s.activos[e.key] = v;
                cambio();
              }),
      ]);
}

class _Chat extends StatefulWidget {
  final SuperAppServicio s;
  final String u;
  final VoidCallback cambio;
  const _Chat(this.s, this.u, this.cambio);
  @override
  State<_Chat> createState() => _ChatState();
}

class _ChatState extends State<_Chat> {
  final texto = TextEditingController();
  String para = 'luis';
  @override
  Widget build(BuildContext context) {
    final lista = widget.s.mensajes
        .where((m) =>
            (m.de == widget.u && m.para == para) ||
            (m.de == para && m.para == widget.u))
        .toList();
    return Column(children: [
      DropdownButton<String>(
          value: para,
          items: ['ana', 'luis', 'marta']
              .where((x) => x != widget.u)
              .map((x) => DropdownMenuItem(
                  value: x, child: Text('Conversación con $x')))
              .toList(),
          onChanged: (v) => setState(() => para = v!)),
      Expanded(
          child: ListView(padding: const EdgeInsets.all(12), children: [
        for (final m in lista)
          Align(
              alignment: m.de == widget.u
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(10), child: Text(m.texto))))
      ])),
      Padding(
          padding: const EdgeInsets.all(8),
          child: Row(children: [
            Expanded(
                child: TextField(
                    controller: texto,
                    decoration: const InputDecoration(labelText: 'Mensaje'))),
            IconButton(
                onPressed: () {
                  widget.s.enviarDineroEnChat(widget.u, para, 5000,
                      'chat-${DateTime.now().microsecondsSinceEpoch}');
                  widget.cambio();
                  setState(() {});
                },
                icon: const Icon(Icons.attach_money)),
            IconButton(
                onPressed: () {
                  widget.s.enviarMensaje(widget.u, para, texto.text);
                  texto.clear();
                  widget.cambio();
                  setState(() {});
                },
                icon: const Icon(Icons.send))
          ]))
    ]);
  }
}

class _Monedero extends StatelessWidget {
  final SuperAppServicio s;
  final String u;
  final VoidCallback cambio;
  const _Monedero(this.s, this.u, this.cambio);
  @override
  Widget build(BuildContext context) =>
      ListView(padding: const EdgeInsets.all(16), children: [
        Text(pesos(s.saldo(u)),
            style: Theme.of(context).textTheme.displaySmall),
        const Text('Saldo didáctico; no representa dinero real.'),
        const Divider(),
        for (final m in s.movimientos[u] ?? [])
          ListTile(
              leading: Icon(
                  m.monto >= 0 ? Icons.arrow_downward : Icons.arrow_upward,
                  color: m.monto >= 0 ? Colors.green : Colors.red),
              title: Text(m.concepto),
              trailing: Text(pesos(m.monto)))
      ]);
}

class _Tienda extends StatelessWidget {
  final SuperAppServicio s;
  final String u;
  final VoidCallback cambio;
  const _Tienda(this.s, this.u, this.cambio);
  @override
  Widget build(BuildContext context) =>
      ListView(padding: const EdgeInsets.all(12), children: [
        Text('Negocios de Dolores',
            style: Theme.of(context).textTheme.headlineSmall),
        for (final p in s.productos)
          Card(
              child: ListTile(
                  leading: Text(p.emoji, style: const TextStyle(fontSize: 32)),
                  title: Text(p.nombre),
                  subtitle:
                      Text('${pesos(p.precio)} · ${p.existencias} disponibles'),
                  trailing: FilledButton(
                      onPressed: p.existencias == 0
                          ? null
                          : () {
                              try {
                                s.comprar(u, p);
                                cambio();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Compra realizada')));
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('$e')));
                              }
                            },
                      child: const Text('Comprar'))))
      ]);
}

class _Viajes extends StatefulWidget {
  final SuperAppServicio s;
  final String u;
  final VoidCallback cambio;
  const _Viajes(this.s, this.u, this.cambio);
  @override
  State<_Viajes> createState() => _ViajesState();
}

class _ViajesState extends State<_Viajes> {
  Viaje? viaje;
  @override
  Widget build(BuildContext context) =>
      ListView(padding: const EdgeInsets.all(16), children: [
        Text('Viajes por Dolores',
            style: Theme.of(context).textTheme.headlineSmall),
        const ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Jardín Principal → Museo de la Independencia'),
            subtitle: Text('Estimado: 3.2 km · \$78.00')),
        if (viaje == null)
          FilledButton(
              onPressed: () {
                setState(() =>
                    viaje = widget.s.pedirViaje(widget.u, 'Jardín', 'Museo'));
                widget.cambio();
              },
              child: const Text('Pedir viaje'))
        else
          Card(
              child: Column(children: [
            ListTile(
                title: Text('Estado: ${viaje!.estado.name}'),
                subtitle: Text('Costo ${pesos(viaje!.costo)}')),
            if (viaje!.estado != EstadoViaje.finalizado)
              FilledButton(
                  onPressed: () {
                    try {
                      widget.s.avanzarViaje(widget.u, viaje!);
                      widget.cambio();
                      setState(() {});
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('$e')));
                    }
                  },
                  child: const Text('Avanzar simulación'))
          ]))
      ]);
}

class _Metricas extends StatelessWidget {
  final SuperAppServicio s;
  const _Metricas(this.s);
  @override
  Widget build(BuildContext context) {
    final activos = s.usos.length;
    final multi = s.usos.values.where((x) => x.length >= 2).length;
    return ListView(padding: const EdgeInsets.all(16), children: [
      const Card(
          child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                  '⚠ Datos simulados para aprender; no representan usuarios reales.'))),
      ListTile(title: const Text('DAU'), trailing: Text('$activos')),
      ListTile(title: const Text('WAU'), trailing: Text('${activos + 3}')),
      ListTile(title: const Text('MAU'), trailing: Text('${activos + 12}')),
      ListTile(
          title: const Text('Usuarios multiservicio'),
          trailing: Text('$multi')),
      const Text(
          'La relación entre uso y retención es correlación, no prueba causalidad. Una prueba A/B sería necesaria.')
    ]);
  }
}
