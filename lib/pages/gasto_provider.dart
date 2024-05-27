import 'package:flutter/material.dart';
import 'gasto.dart';
import 'categoria_provider.dart';

class GastoProvider with ChangeNotifier {
  List<Gasto> _gastos = [];

  List<Gasto> get gastos => _gastos;

  double get totalGastos {
    return _gastos.fold(0, (sum, item) => sum + item.valor);
  }

  void addGasto(Gasto gasto, CategoriaProvider categoriaProvider) {
    _gastos.add(gasto);
    categoriaProvider.atualizarValorGasto(gasto.categoriaIcone, gasto.valor);
    notifyListeners();
  }

  void removeGasto(Gasto gasto, CategoriaProvider categoriaProvider) {
    _gastos.remove(gasto);
    categoriaProvider.removerValorGasto(gasto.categoriaIcone, gasto.valor);
    notifyListeners();
  }
}
