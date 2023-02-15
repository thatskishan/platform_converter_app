import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../globals/globalFile.dart';

class ChatIOS extends StatefulWidget {
  const ChatIOS({Key? key}) : super(key: key);

  @override
  State<ChatIOS> createState() => _ChatIOSState();
}

class _ChatIOSState extends State<ChatIOS> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border.all(
          color: CupertinoColors.white,
        ),
        leading: Text(
          "Chats",
          style: GoogleFonts.openSans(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Broadcast Lists",
                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: CupertinoColors.link),
                  ),
                  Text(
                    "New Group",
                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: CupertinoColors.link),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.archive,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Archieved",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: Global.chatData
                    .map(
                      (e) => Column(
                        children: [
                          CupertinoListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: const FlutterLogo(),
                            ),
                            title: Text(
                              e['title'],
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              e['subtitle'],
                              style: GoogleFonts.openSans(fontSize: 16),
                            ),
                            trailing: Text(
                              e['trailing'],
                              style: GoogleFonts.openSans(fontSize: 16),
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
