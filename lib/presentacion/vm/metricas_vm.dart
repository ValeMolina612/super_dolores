import 'package:flutter/foundation.dart';
import '../../dominio/super_app.dart';

class MetricasViewModel extends ChangeNotifier {
  final SuperAppServicio app;
  MetricasViewModel(this.app);
  int get dau => app.usos.length;
  int get multiservicio => app.usos.values.where((x) => x.length >= 2).length;
}
