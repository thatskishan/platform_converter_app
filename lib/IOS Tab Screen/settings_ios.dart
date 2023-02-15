import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsIOS extends StatefulWidget {
  const SettingsIOS({Key? key}) : super(key: key);

  @override
  State<SettingsIOS> createState() => _SettingsIOSState();
}

class _SettingsIOSState extends State<SettingsIOS> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border.all(
          color: CupertinoColors.white,
        ),
        leading: Text(
          "Settings",
          style: GoogleFonts.openSans(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: Text(
                "Kishan Virani",
                style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Love What You Do.",
                style: GoogleFonts.openSans(fontSize: 18),
              ),
              leading: const FlutterLogo(),
              trailing: const Icon(
                Icons.qr_code,
              ),
            ),
            const Divider(),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("Avatar"),
              leading: const Icon(
                Icons.emoji_emotions_outlined,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("Starred Messages"),
              leading: const Icon(
                Icons.star,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("Linked Devices"),
              leading: const Icon(
                Icons.laptop,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("Account"),
              leading: const Icon(
                Icons.key,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("Privacy"),
              leading: const Icon(
                Icons.lock,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("Chats"),
              leading: Icon(
                Icons.chat,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("notifications"),
              leading: const Icon(
                Icons.notification_add,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("Payments"),
              leading: const Icon(
                Icons.payment,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("Storage and Data"),
              leading: const Icon(
                Icons.storage,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("Help"),
              leading: const Icon(
                Icons.help,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: const Text("Tell a Friend"),
              leading: const Icon(
                Icons.file_copy,
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
