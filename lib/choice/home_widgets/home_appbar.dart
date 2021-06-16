import 'package:flutter/material.dart';

AppBar getHomeAppBar() {
  return AppBar(
    title: Text("Ações e Fundos"),
    centerTitle: true,
    backgroundColor: Color(0xff363c50), //0xff => #
    actions: [
      IconButton(
        icon: Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    ],
  );
}
