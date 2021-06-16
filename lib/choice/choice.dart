
import 'package:flutter/material.dart';
import 'package:flutter_crud/constants/custom_colors.dart';
import 'package:flutter_crud/views/lista_acoes.dart';
import 'package:flutter_crud/views/lista_fundos.dart';
import 'home_widgets/home_appbar.dart';
import 'home_widgets/home_drawer.dart';


class ChoicePage extends StatelessWidget {
  const ChoicePage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(),
      drawer: getHomeDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientMainColor(),
              CustomColors().getGradientSecondaryColor(),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: deprecated_member_use
              RaisedButton(
                padding: EdgeInsets.only(left: 200, right: 200, top:35, bottom: 35),
                color: Colors.blueGrey[800],
                textColor: Colors.white,
                child: Text('Cadastrar ações'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => AcoesList(),
                    ),
                  );
                },
              ),

              // ignore: deprecated_member_use
              RaisedButton(
                padding: EdgeInsets.only(left: 197, right: 197, top:35, bottom: 35),
                color: Colors.blueGrey[800],
                textColor: Colors.white,
                child: Text('Cadastrar fundos'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => AcoesList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}