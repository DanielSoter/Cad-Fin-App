import 'package:flutter/material.dart';
import 'package:flutter_crud/models/Fundos.dart';
import 'package:flutter_crud/provider/FundosProvider.dart';
import 'package:provider/provider.dart';

class FundosForm extends StatefulWidget {
  @override
  _FundosFormState createState() => _FundosFormState();
}

class _FundosFormState extends State<FundosForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Fundos fundos) {
    if(fundos != null) {
      _formData['id'] = fundos.id;
      _formData['tipo'] = fundos.tipo;
      _formData['sigla'] = fundos.sigla;
      _formData['nome'] = fundos.nome;
      _formData['setor'] = fundos.setor;
      _formData['investMinin'] = fundos.investMinin;
      _formData['ativoTotal'] = fundos.ativoTotal;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final Fundos fundos = ModalRoute.of(context).settings.arguments;
    _loadFormData(fundos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de fundos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();

                Provider.of<FundosProv>(context, listen: false).put(
                  Fundos(
                    id: _formData['id'],
                    tipo: _formData['tipo'],
                    sigla: _formData['sigla'],
                    nome: _formData['nome'],
                    setor: _formData['setor'],
                    investMinin: _formData['investMinin'],
                    ativoTotal: _formData['ativoTotal'],
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['tipo'],
                decoration: InputDecoration(labelText: 'Tipo'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'tipo inválido';
                  }

                  if (value.trim().length < 2) {
                    return 'tipo muito pequeno. No mínimo 2 letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['tipo'] = value,
              ),
              TextFormField(
                initialValue: _formData['sigla'],
                decoration: InputDecoration(labelText: 'Sigla'),
                onSaved: (value) => _formData['sigla'] = value,
              ),
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['setor'],
                decoration: InputDecoration(labelText: 'Setor'),
                onSaved: (value) => _formData['setor'] = value,
              ),
              TextFormField(
                initialValue: _formData['investMinin'],
                decoration: InputDecoration(labelText: 'Investimento mínimo'),
                onSaved: (value) => _formData['investMinin'] = value,
              ),
              TextFormField(
                initialValue: _formData['ativoTotal'],
                decoration: InputDecoration(labelText: 'Ativo Total'),
                onSaved: (value) => _formData['ativoTotal'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
