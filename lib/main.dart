import 'package:flutter/material.dart';
import 'package:flutter_crud/login/login_page.dart';
import 'package:flutter_crud/provider/AcoesProvider.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/acoes_form.dart';
import 'package:flutter_crud/views/fundos_form.dart';
import 'package:flutter_crud/views/lista_acoes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AcoesProv(),
        ),
      ],
      child: MaterialApp(
        title: 'Cad fin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => LoginPage(),
          AppRoutes.ACOES_FORM: (_) => AcoesForm(),
          AppRoutes.FUNDOS_FORM: (_) => FundosForm()
        },
      ),
    );
  }
}
