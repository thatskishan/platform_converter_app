import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../globals/globalFile.dart';

class CallIOS extends StatefulWidget {
  const CallIOS({Key? key}) : super(key: key);

  @override
  State<CallIOS> createState() => _CallIOSState();
}

class _CallIOSState extends State<CallIOS> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border.all(
          color: CupertinoColors.white,
        ),
        leading: Text(
          "Status",
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
              CupertinoListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(
                    CupertinoIcons.link,
                  ),
                ),
                title: Text(
                  "Create Call Link",
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Share a link for your Whatsapp call",
                  style: GoogleFonts.openSans(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: Global.callData
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
                              "Incoming",
                              style: GoogleFonts.openSans(fontSize: 16),
                            ),
                            trailing: Row(
                              children: [
                                Text(
                                  e['trailing'],
                                  style: GoogleFonts.openSans(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(CupertinoIcons.info),
                              ],
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
