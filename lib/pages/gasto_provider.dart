import 'package:flutter/material.dart';
import 'gasto.dart';

class GastoProvider with ChangeNotifier {
  List<Gasto> _gastos = [];

  List<Gasto> get gastos => _gastos;

  double get totalGastos => _gastos.fold(0, (sum, item) => sum + item.valor);

  void addGasto(Gasto gasto) {
    _gastos.add(gasto);
    notifyListeners();
  }

  void removeGasto(Gasto gasto) {
    _gastos.remove(gasto);
    notifyListeners();
  }
}
