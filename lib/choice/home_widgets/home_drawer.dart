import 'package:flutter/material.dart';
import 'package:flutter_crud/constants/custom_colors.dart';

Drawer getHomeDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Color(0xff0A6D92)),
          accountName: Text("Daniel H. Soter"),
          accountEmail: Text("danielsoter3@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "DS",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: CustomColors().getAppBarMainColor(),
          ),
          title: Text(
            "Configurações",
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.arrow_back_sharp,
            color: CustomColors().getAppBarMainColor(),
          ),
          
          title: Text(
            "Sair",
          ),
        )
      ],
    ),
  );
}
