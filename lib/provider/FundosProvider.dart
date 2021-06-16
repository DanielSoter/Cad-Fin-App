import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_crud/data/mockFundos.dart';
import 'package:flutter_crud/models/Fundos.dart';

class FundosProv with ChangeNotifier {
  final Map<String, Fundos> _items = {...DUMMY_USERS};

  List<Fundos> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Fundos byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Fundos fundos) {
    if (fundos == null) {
      return;
    }

    if (fundos.id != null &&
        fundos.id.trim().isNotEmpty &&
        _items.containsKey(fundos.id)) {
      _items.update(
        fundos.id,
        (_) => Fundos(
          id: fundos.id,
          tipo: fundos.tipo,
          sigla: fundos.sigla,
          nome: fundos.nome,
          setor: fundos.setor,
          investMinin: fundos.investMinin,
          ativoTotal: fundos.ativoTotal,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Fundos(
         id: fundos.id,
          tipo: fundos.tipo,
          sigla: fundos.sigla,
          nome: fundos.nome,
          setor: fundos.setor,
          investMinin: fundos.investMinin,
          ativoTotal: fundos.ativoTotal,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Fundos fundos) {
    if(fundos != null && fundos.id != null) {
      _items.remove(fundos.id);
      notifyListeners();
    }
  }
}
