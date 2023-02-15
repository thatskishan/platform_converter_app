import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platform_converter_app/globals/globalFile.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const FlutterLogo(),
                title: Text(
                  "Create call link",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Share a link for your whatsapp call",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Text(
                "Recent updates",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: Global.callData
                        .map(
                          (e) => ListTile(
                            leading: const FlutterLogo(),
                            title: Text(
                              "${e['title']}",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${e['trailing']}",
                              style: GoogleFonts.poppins(),
                            ),
                            trailing: const Icon(
                              Icons.call,
                              color: Color(0xff008069),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff008069),
          onPressed: () {},
          child: const Icon(
            Icons.add_ic_call,
          ),
        ));
  }
}
