import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ms_9_offline_note/Pages/settings_page.dart';
import 'package:ms_9_offline_note/component/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(children: [
          DrawerHeader(child: Icon(Icons.edit)),
          DrawerTile(title: "Notes", leading: Icon(Icons.home), onTap: () {
             Navigator.pop(context);
          }),
          DrawerTile(title: "Settings", leading: Icon(Icons.settings), onTap: (){
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context) => SettingsPage()));
          }),
      ]),
    );
  }
}