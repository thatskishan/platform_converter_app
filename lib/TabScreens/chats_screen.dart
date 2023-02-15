import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platform_converter_app/globals/globalFile.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: Global.chatData
                .map(
                  (e) => ListTile(
                    leading: FlutterLogo(),
                    title: Text(
                      "${e['title']}",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${e['subtitle']}",
                      style: GoogleFonts.poppins(),
                    ),
                    trailing: Text(
                      "${e['trailing']}",
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff008069),
        onPressed: () {},
        child: const Icon(
          Icons.message,
        ),
      ),
    );
  }
}
