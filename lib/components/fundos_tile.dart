import 'package:flutter/material.dart';
import 'package:flutter_crud/models/Fundos.dart';
import 'package:flutter_crud/provider/FundosProvider.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final Fundos acoes;

  const UserTile(this.acoes);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(acoes.nome),
      subtitle: Text(acoes.sigla),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.FUNDOS_FORM,
                  arguments: acoes,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir fundo'),
                    content: Text('Tem certeza???'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then((confimed) {
                  if (confimed) {
                    Provider.of<FundosProv>(context, listen: false).remove(acoes);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
