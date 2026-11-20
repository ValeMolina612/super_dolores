import 'package:flutter_test/flutter_test.dart';
import 'package:super_dolores/main.dart';

void main() {
  testWidgets('Ronda 1 - la SuperApp inicia', (tester) async {
    await tester.pumpWidget(const SuperDoloresApp());
    expect(find.text('Super Dolores'), findsOneWidget);
    expect(find.text('Tu plaza digital de Dolores Hidalgo'), findsOneWidget);
    expect(find.text('Saldo de práctica'), findsOneWidget);
  });
}
