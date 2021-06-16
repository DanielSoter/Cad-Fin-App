import 'package:flutter/material.dart';
import 'package:flutter_crud/components/fundos_tile.dart';
import 'package:flutter_crud/provider/FundosProvider.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';


class FundosList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FundosProv fundos = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundos cadastradas'),
        centerTitle: true,
        backgroundColor: Color(0xff363c50), 
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.FUNDOS_FORM
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: fundos.count,
        itemBuilder: (ctx, i) => UserTile(fundos.byIndex(i)),
      ),
    );
  }
}
