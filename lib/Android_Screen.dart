import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platform_converter_app/globals/globalFile.dart';
import 'package:platform_converter_app/views/components/drawer.dart';

import 'TabScreens/calls_screen.dart';
import 'TabScreens/chats_screen.dart';
import 'TabScreens/status_screen.dart';

class PlatformConverter extends StatefulWidget {
  const PlatformConverter({Key? key}) : super(key: key);

  @override
  State<PlatformConverter> createState() => _PlatformConverterState();
}

class _PlatformConverterState extends State<PlatformConverter>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int pageIndex = 0;

  List<Map> myTabs = [
    {
      'label': "Chats",
      'index': 0,
    },
    {
      'label': "Status",
      'index': 1,
    },
    {
      'label': "Call",
      'index': 2,
    },
  ];

  List myScreens = [
    const ChatScreen(),
    const StatusScreen(),
    const CallScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff008069),
        title: Text(
          "Whatsapp",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          ),
          Switch.adaptive(
              value: Global.isAndroid,
              onChanged: (val) {
                setState(() {
                  Global.isAndroid = val;
                });
              }),
          PopupMenuButton(
            onSelected: (value) {},
            itemBuilder: (BuildContext popup) {
              return [
                PopupMenuItem(
                  value: 'New group',
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                height: 350,
                                alignment: Alignment.center,
                                child: Text(
                                  "Bottom Model Sheet",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text(
                      "New group",
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'New broadcast',
                  child: Text(
                    "New broadcast",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                PopupMenuItem(
                  value: 'Linked Devices',
                  child: Text(
                    "Linked Devices",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                PopupMenuItem(
                  value: 'Started messages',
                  child: Text(
                    "Started messages",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                PopupMenuItem(
                  value: 'Settings',
                  child: Text(
                    "Settings",
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: myTabs
              .map((e) => Tab(
                    child: Text(
                      "${e['label']}",
                      style: GoogleFonts.poppins(),
                    ),
                  ))
              .toList(),
        ),
      ),
      drawer: const MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        physics: const BouncingScrollPhysics(),
        children: const [
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
    );
  }
}
