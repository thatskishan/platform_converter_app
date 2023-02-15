import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platform_converter_app/globals/globalFile.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
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
                "My Status",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Yesterday, 6:30 pm",
                style: GoogleFonts.poppins(),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
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
                  children: Global.statusData
                      .map((e) => ListTile(
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
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.grey.shade300,
            onPressed: () {},
            child: const Icon(
              Icons.edit,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: const Color(0xff008069),
            onPressed: () {},
            child: const Icon(
              Icons.camera_alt_outlined,
            ),
          )
        ],
      ),
    );
  }
}
