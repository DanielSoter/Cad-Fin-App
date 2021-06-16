import 'package:flutter/material.dart';

class Acoes {
  final String id;
  final String tipo;
  final String sigla;
  final String nome;
  final String setor;
  final String recLiquid;
  final String ativoTotal;

  const Acoes({
    this.id,
    @required this.tipo,
    @required this.sigla,
    @required this.nome,
    @required this.setor,
    @required this.recLiquid,
    @required this.ativoTotal,
  });
}