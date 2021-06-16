import 'package:flutter/material.dart';
import 'package:flutter_crud/choice/home_widgets/home_drawer.dart';
import 'package:flutter_crud/components/acoes_tile.dart';
import 'package:flutter_crud/provider/AcoesProvider.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';


class AcoesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AcoesProv acoes = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ações cadastradas'),
        centerTitle: true,
        backgroundColor: Color(0xff363c50), 
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.ACOES_FORM
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: acoes.count,
        itemBuilder: (ctx, i) => UserTile(acoes.byIndex(i)),
      ),
    );
  }
}
