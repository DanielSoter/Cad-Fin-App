import 'package:flutter/material.dart';
import 'package:flutter_crud/models/Acoes.dart';
import 'package:flutter_crud/provider/AcoesProvider.dart';
import 'package:provider/provider.dart';

class AcoesForm extends StatefulWidget {
  @override
  _AcoesFormState createState() => _AcoesFormState();
}

class _AcoesFormState extends State<AcoesForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Acoes acoes) {
    if(acoes != null) {
      _formData['id'] = acoes.id;
      _formData['tipo'] = acoes.tipo;
      _formData['sigla'] = acoes.sigla;
      _formData['nome'] = acoes.nome;
      _formData['setor'] = acoes.setor;
      _formData['recLiquid'] = acoes.recLiquid;
      _formData['ativoTotal'] = acoes.ativoTotal;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final Acoes user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Ações'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();

                Provider.of<AcoesProv>(context, listen: false).put(
                  Acoes(
                    id: _formData['id'],
                    tipo: _formData['tipo'],
                    sigla: _formData['sigla'],
                    nome: _formData['nome'],
                    setor: _formData['setor'],
                    recLiquid: _formData['recLiquid'],
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
                initialValue: _formData['recLiquid'],
                decoration: InputDecoration(labelText: 'Receita Liquida'),
                onSaved: (value) => _formData['recLiquid'] = value,
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
