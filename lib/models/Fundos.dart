import 'package:flutter/material.dart';

class Fundos {
  final String id;
  final String tipo;
  final String sigla;
  final String nome;
  final String setor;
  final String investMinin;
  final String ativoTotal;

  const Fundos({
    this.id,
    @required this.tipo,
    @required this.sigla,
    @required this.nome,
    @required this.setor,
    @required this.investMinin,
    @required this.ativoTotal,
  });
}