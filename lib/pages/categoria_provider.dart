import 'package:flutter/material.dart';
import 'icons.dart';

class CategoriaProvider with ChangeNotifier {
  List<CategoriaIcone> _categorias = categoriasIcones;

  List<CategoriaIcone> get categorias => _categorias;

  void adicionaCategoria(CategoriaIcone novaCategoria) {
    _categorias.add(novaCategoria);
    notifyListeners();
  }

  void removeCategoria(String nome) {
    _categorias.removeWhere((categoria) => categoria.nome == nome);
    notifyListeners();
  }

  void modificaCategoria(
      String nome, IconData icone, Color cor, double valor_gasto) {
    int index = _categorias.indexWhere((categoria) => categoria.nome == nome);
    if (index != -1) {
      _categorias[index] = CategoriaIcone(nome, icone, cor, valor_gasto);
      notifyListeners();
    }
  }

  void modificaIconeCategoria(String nome, IconData novoIcone) {
    int index = _categorias.indexWhere((categoria) => categoria.nome == nome);
    if (index != -1) {
      _categorias[index].icone = novoIcone;
      notifyListeners();
    }
  }

  void modificaCorCategoria(String nome, Color novaCor) {
    int index = _categorias.indexWhere((categoria) => categoria.nome == nome);
    if (index != -1) {
      _categorias[index].cor = novaCor;
      notifyListeners();
    }
  }

  void atualizarValorGasto(IconData icone, double valor) {
    final categoria = _categorias.firstWhere((cat) => cat.icone == icone);
    categoria.valor_gasto += valor;
    notifyListeners();
  }

  void removerValorGasto(IconData icone, double valor) {
    final categoria = _categorias.firstWhere((cat) => cat.icone == icone);
    categoria.valor_gasto -= valor;
    notifyListeners();
  }
}
