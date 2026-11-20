# Super Dolores

SuperApp didáctica basada en el manual TDD: mensajería, monedero, comercio, transporte, lealtad, permisos, interruptores de emergencia y métricas en una sola aplicación Flutter.

> Esta aplicación es una simulación escolar. No mueve dinero real, no solicita viajes reales y no almacena datos personales.

## Fases TDD

Cada ronda sigue el mismo ciclo:

1. 🔴 **Rojo:** se escribe una prueba que describe el comportamiento y se confirma que falla.
2. 🟢 **Verde:** se agrega la implementación mínima y la prueba pasa.
3. 🔵 **Refactorización:** se ordena el código manteniendo todas las pruebas en verde.

| Ronda | Funcionalidad | Pruebas |
|---|---|---|
| 1 | Preparación e inicio Flutter | Inicio real de `SuperDoloresApp` |
| 2 | Dinero y libro de movimientos | Formato, saldo, conservación e idempotencia |
| 3 | Mensajería | Validaciones, conversaciones y dinero en chat |
| 4 | Comercio | Compra, inventario y saldo |
| 5 | Transporte | Solicitud y máquina de estados |
| 6 | Eventos | Registro de uso desacoplado |
| 7 | Mini-apps y permisos | Interruptor de emergencia |
| 8 | Integración entre servicios | Chat + pagos + lealtad |
| 9 | Lealtad | Puntos por acciones útiles |
| 10 | Notificaciones | Mensajes seguros dentro de la app |
| 11 | Analítica | Uso por servicio y multiservicio |
| 12 | Retención | DAU, WAU y MAU simulados |
| 13 | ViewModels y pantallas | Interacción de los seis módulos |
| 14 | Pruebas con personas | Guía de usabilidad del manual |
| 15 | Camino a producción | Advertencias legales, privacidad y seguridad |

## Capturas reales de las 15 rondas

Las fases rojas son ejecuciones controladas de la prueba antes de implementar el comportamiento. Las fases verdes muestran la suite completa aprobada. Todas fueron tomadas en Visual Studio Code y muestran la cuenta `ValeMolina612 (GitHub)`.

### Ronda 1 - Preparación
#### 🔴 Roja
![Ronda 1 roja](docs/capturas/ronda-01-rojo.png)
#### 🟢 Verde
![Ronda 1 verde](docs/capturas/ronda-01-verde.png)

### Ronda 2 - Dinero
#### 🔴 Roja
![Ronda 2 roja](docs/capturas/ronda-02-rojo.png)
#### 🟢 Verde
![Ronda 2 verde](docs/capturas/ronda-02-verde.png)

### Ronda 3 - Mensajería
#### 🔴 Roja
![Ronda 3 roja](docs/capturas/ronda-03-rojo.png)
#### 🟢 Verde
![Ronda 3 verde](docs/capturas/ronda-03-verde.png)

### Ronda 4 - Comercio
#### 🔴 Roja
![Ronda 4 roja](docs/capturas/ronda-04-rojo.png)
#### 🟢 Verde
![Ronda 4 verde](docs/capturas/ronda-04-verde.png)

### Ronda 5 - Transporte
#### 🔴 Roja
![Ronda 5 roja](docs/capturas/ronda-05-rojo.png)
#### 🟢 Verde
![Ronda 5 verde](docs/capturas/ronda-05-verde.png)

### Ronda 6 - Eventos
#### 🔴 Roja
![Ronda 6 roja](docs/capturas/ronda-06-rojo.png)
#### 🟢 Verde
![Ronda 6 verde](docs/capturas/ronda-06-verde.png)

### Ronda 7 - Mini-apps y permisos
#### 🔴 Roja
![Ronda 7 roja](docs/capturas/ronda-07-rojo.png)
#### 🟢 Verde
![Ronda 7 verde](docs/capturas/ronda-07-verde.png)

### Ronda 8 - Integración
#### 🔴 Roja
![Ronda 8 roja](docs/capturas/ronda-08-rojo.png)
#### 🟢 Verde
![Ronda 8 verde](docs/capturas/ronda-08-verde.png)

### Ronda 9 - Lealtad
#### 🔴 Roja
![Ronda 9 roja](docs/capturas/ronda-09-rojo.png)
#### 🟢 Verde
![Ronda 9 verde](docs/capturas/ronda-09-verde.png)

### Ronda 10 - Notificaciones
#### 🔴 Roja
![Ronda 10 roja](docs/capturas/ronda-10-rojo.png)
#### 🟢 Verde
![Ronda 10 verde](docs/capturas/ronda-10-verde.png)

### Ronda 11 - Analítica
#### 🔴 Roja
![Ronda 11 roja](docs/capturas/ronda-11-rojo.png)
#### 🟢 Verde
![Ronda 11 verde](docs/capturas/ronda-11-verde.png)

### Ronda 12 - Retención
#### 🔴 Roja
![Ronda 12 roja](docs/capturas/ronda-12-rojo.png)
#### 🟢 Verde
![Ronda 12 verde](docs/capturas/ronda-12-verde.png)

### Ronda 13 - ViewModels y pantallas
#### 🔴 Roja
![Ronda 13 roja](docs/capturas/ronda-13-rojo.png)
#### 🟢 Verde
![Ronda 13 verde](docs/capturas/ronda-13-verde.png)

### Ronda 14 - Usabilidad responsable
#### 🔴 Roja
![Ronda 14 roja](docs/capturas/ronda-14-rojo.png)
#### 🟢 Verde
![Ronda 14 verde](docs/capturas/ronda-14-verde.png)

### Ronda 15 - Seguridad y producción
#### 🔴 Roja
![Ronda 15 roja](docs/capturas/ronda-15-rojo.png)
#### 🟢 Verde
![Ronda 15 verde](docs/capturas/ronda-15-verde.png)

## APIs y servidores

## 🔵 Fase azul de refactorización - 15 rondas

Después de cada implementación se ordenó el código y se volvió a comprobar la suite sin cambiar el comportamiento.

| Ronda | Evidencia azul |
|---|---|
| 1 | ![Ronda 1 azul](docs/capturas/ronda-01-azul.png) |
| 2 | ![Ronda 2 azul](docs/capturas/ronda-02-azul.png) |
| 3 | ![Ronda 3 azul](docs/capturas/ronda-03-azul.png) |
| 4 | ![Ronda 4 azul](docs/capturas/ronda-04-azul.png) |
| 5 | ![Ronda 5 azul](docs/capturas/ronda-05-azul.png) |
| 6 | ![Ronda 6 azul](docs/capturas/ronda-06-azul.png) |
| 7 | ![Ronda 7 azul](docs/capturas/ronda-07-azul.png) |
| 8 | ![Ronda 8 azul](docs/capturas/ronda-08-azul.png) |
| 9 | ![Ronda 9 azul](docs/capturas/ronda-09-azul.png) |
| 10 | ![Ronda 10 azul](docs/capturas/ronda-10-azul.png) |
| 11 | ![Ronda 11 azul](docs/capturas/ronda-11-azul.png) |
| 12 | ![Ronda 12 azul](docs/capturas/ronda-12-azul.png) |
| 13 | ![Ronda 13 azul](docs/capturas/ronda-13-azul.png) |
| 14 | ![Ronda 14 azul](docs/capturas/ronda-14-azul.png) |
| 15 | ![Ronda 15 azul](docs/capturas/ronda-15-azul.png) |

**No hay ninguna API que instalar, activar ni configurar.** El manual especifica servicios simulados y datos en memoria. La aplicación funciona sin llave, sin Node, sin base de datos y sin conexión a Internet.

Para convertirla en una app real serían necesarios proveedores autorizados para pagos, mapas/transporte, autenticación, notificaciones y un backend seguro. Esos servicios no se incluyen porque requieren cuentas, llaves privadas y cumplimiento legal.

## Ejecutar las pruebas

Abre una terminal dentro de la carpeta:

```powershell
flutter pub get
flutter test
```

## Ejecutar en el emulador Android

1. Abre Android Studio y en **Device Manager** inicia tu emulador.
2. Comprueba el identificador:

```powershell
flutter devices
```

3. Si aparece, por ejemplo, `emulator-5554`, ejecuta:

```powershell
flutter run -d emulator-5554
```

Si tu emulador tiene otro identificador, usa el que aparece en `flutter devices`. También puedes ejecutar simplemente `flutter run` y elegir el dispositivo.

## Funciones para probar

- Cambiar entre Ana, Luis y Marta.
- Enviar mensajes y $50 desde el chat.
- Revisar saldos y movimientos.
- Comprar nieve, talavera o cajeta.
- Simular un viaje hasta finalizarlo.
- Consultar métricas didácticas.
- Apagar módulos con los interruptores de emergencia.

## Estructura

```text
lib/
  dominio/       Reglas puras, modelos y servicios simulados
  presentacion/  Pantallas de la SuperApp
  main.dart      Entrada de Flutter
test/            Pruebas de dominio y widgets
android/         Proyecto para el emulador Android
```
