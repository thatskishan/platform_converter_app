import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff008069),
            ),
            accountName: Text("Whatsapp"),
            accountEmail: Text("yourname@mail.com"),
          ),
          Expanded(
              flex: 3,
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text("Account"),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("About us"),
                  ),
                ],
              )),
          const Divider(
            thickness: 2,
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Log-out"),
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text("Share"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
