import 'package:flutter/material.dart';
import 'package:goshopwooapp/Screens/Utilities/all_routes.dart';

Drawer mainDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(child: null),
        ListTile(
          title: Text("Home"),
          trailing: Icon(Icons.home),
          onTap: () async {
            goHome(context);
          },
        ),
        ListTile(
          title: Text("Orders"),
          trailing: Icon(Icons.assignment),
          onTap: () async {

          },
        ),
        ListTile(
          title: Text("Categories"),
          trailing: Icon(Icons.call_to_action),
          onTap: () async {

          },
        ),
        ListTile(
          title: Text("Favorites"),
          trailing: Icon(Icons.favorite),
          onTap: () async {

          },
        ),
        ListTile(
          title: Text("Settings"),
          trailing: Icon(Icons.settings),
          onTap: () async {

          },
        ),
        ListTile(
          title: Text("Logout"),
          trailing: Icon(Icons.exit_to_app),
          onTap: () async {
          logOut(context);
          },
        ),

      ],
    ),
  );
}