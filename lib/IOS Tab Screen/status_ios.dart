import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platform_converter_app/globals/globalFile.dart';

class StatusIOS extends StatefulWidget {
  const StatusIOS({Key? key}) : super(key: key);

  @override
  State<StatusIOS> createState() => _StatusIOSState();
}

class _StatusIOSState extends State<StatusIOS> {
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
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const FlutterLogo(),
                ),
                title: Text(
                  "My Status",
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Add to my status",
                  style: GoogleFonts.openSans(fontSize: 16),
                ),
                trailing: Row(
                  children: const [
                    Icon(
                      CupertinoIcons.camera,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      CupertinoIcons.pen,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "ADD TO MY STATUS",
                style: GoogleFonts.openSans(
                    fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: Global.statusData
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
