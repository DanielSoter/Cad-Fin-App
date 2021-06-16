import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/mockAcoes.dart';
import 'package:flutter_crud/models/Acoes.dart';

class AcoesProv with ChangeNotifier {
  final Map<String, Acoes> _items = {...DUMMY_USERS};

  List<Acoes> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Acoes byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Acoes acoes) {
    if (acoes == null) {
      return;
    }

    if (acoes.id != null &&
        acoes.id.trim().isNotEmpty &&
        _items.containsKey(acoes.id)) {
      _items.update(
        acoes.id,
        (_) => Acoes(
          id: acoes.id,
          tipo: acoes.tipo,
          sigla: acoes.sigla,
          nome: acoes.nome,
          setor: acoes.setor,
          recLiquid: acoes.recLiquid,
          ativoTotal: acoes.ativoTotal,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Acoes(
         id: acoes.id,
          tipo: acoes.tipo,
          sigla: acoes.sigla,
          nome: acoes.nome,
          setor: acoes.setor,
          recLiquid: acoes.recLiquid,
          ativoTotal: acoes.ativoTotal,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Acoes acoes) {
    if(acoes != null && acoes.id != null) {
      _items.remove(acoes.id);
      notifyListeners();
    }
  }
}
