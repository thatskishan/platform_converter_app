import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platform_converter_app/IOS%20Tab%20Screen/call_ios.dart';
import 'package:platform_converter_app/IOS%20Tab%20Screen/chats_ios.dart';
import 'package:platform_converter_app/IOS%20Tab%20Screen/communities_ios.dart';
import 'package:platform_converter_app/IOS%20Tab%20Screen/settings_ios.dart';
import 'package:platform_converter_app/IOS%20Tab%20Screen/status_ios.dart';
import 'package:platform_converter_app/TabScreens/calls_screen.dart';
import 'package:platform_converter_app/TabScreens/chats_screen.dart';
import 'package:platform_converter_app/TabScreens/status_screen.dart';
import 'package:platform_converter_app/globals/globalFile.dart';

import 'Android_Screen.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAndroid = true;
  final screenControl = [
    const StatusIOS(),
    const CallIOS(),
    const CommunitiesIOS(),
    const ChatIOS(),
    const SettingsIOS(),
  ];
  @override
  Widget build(BuildContext context) {
    return Global.isAndroid
        ? MaterialApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const PlatformConverter(),
              'chat_screen': (context) => const ChatScreen(),
              'status_screen': (context) => const StatusScreen(),
              'call_screen': (context) => const CallScreen(),
            },
          )
        : CupertinoApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            home: Builder(
              builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    backgroundColor: CupertinoColors.white,
                    border: Border.all(color: CupertinoColors.white),
                    leading: Text(
                      "Edit",
                      style: GoogleFonts.openSans(
                        color: CupertinoColors.link,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(CupertinoIcons.camera),
                        const SizedBox(
                          width: 10,
                        ),
                        CupertinoSwitch(
                          value: Global.isAndroid,
                          onChanged: (val) => setState(
                            () => Global.isAndroid = val,
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: CupertinoTabScaffold(
                    tabBar: CupertinoTabBar(
                      // items: IOSTab.myIOSTab
                      //     .map(
                      //       (e) => BottomNavigationBarItem(
                      //         icon: Icon(e['icon']),
                      //         label: e['name'],
                      //       ),
                      //     )
                      //     .toList(),
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.at_circle),
                          label: "Status",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.phone),
                          label: "Calls",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.group),
                          label: "Communities",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                          label: "Chats",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.settings),
                          label: "Settings",
                        ),
                      ],
                    ),
                    // tabBuilder: (context, i) {
                    //   if (i == 0) {
                    //     return const TodayIOS();
                    //   } else if (i == 1) {
                    //     return const GamesIOS();
                    //   } else if (i == 2) {
                    //     return const AppsIOS();
                    //   } else if (i == 3) {
                    //     return const ArcadeIOS();
                    //   } else if (i == 4) {
                    //     return const SearchIOS();
                    //   }
                    //   return Container();
                    // },
                    tabBuilder: (context, index) {
                      return CupertinoTabView(
                        builder: (context) {
                          return screenControl[index];
                        },
                      );
                    },
                  ),
                );
              },
            ),
          );
  }
}

// MaterialApp(
// debugShowCheckedModeBanner: false,
// routes: {
// '/': (context) => const PlatformConverter(),
// 'chat_screen': (context) => const ChatScreen(),
// 'status_screen': (context) => const StatusScreen(),
// 'call_screen': (context) => const CallScreen(),
// },
// ),

// class PlatformConverter extends StatefulWidget {
//   const PlatformConverter({Key? key}) : super(key: key);
//
//   @override
//   State<PlatformConverter> createState() => _PlatformConverterState();
// }
//
// class _PlatformConverterState extends State<PlatformConverter>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   int pageIndex = 0;
//
//   List<Map> myTabs = [
//     {
//       'label': "Chats",
//       'index': 0,
//     },
//     {
//       'label': "Status",
//       'index': 1,
//     },
//     {
//       'label': "Call",
//       'index': 2,
//     },
//   ];
//
//   List myScreens = [
//     const ChatScreen(),
//     const StatusScreen(),
//     const CallScreen(),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: myTabs.length, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff008069),
//         title: Text(
//           "Whatsapp",
//           style: GoogleFonts.poppins(),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.camera_alt_outlined,
//               color: Colors.white,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.search,
//               color: Colors.white,
//             ),
//           ),
//           PopupMenuButton(
//             onSelected: (value) {},
//             itemBuilder: (BuildContext popup) {
//               return [
//                 PopupMenuItem(
//                   value: 'New group',
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(
//                         () {
//                           showModalBottomSheet(
//                             context: context,
//                             shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(15),
//                               ),
//                             ),
//                             builder: (BuildContext context) {
//                               return Container(
//                                 height: 350,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "Bottom Model Sheet",
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       );
//                     },
//                     child: Text(
//                       "New group",
//                       style: GoogleFonts.poppins(),
//                     ),
//                   ),
//                 ),
//                 PopupMenuItem(
//                   value: 'New broadcast',
//                   child: Text(
//                     "New broadcast",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ),
//                 PopupMenuItem(
//                   value: 'Linked Devices',
//                   child: Text(
//                     "Linked Devices",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ),
//                 PopupMenuItem(
//                   value: 'Started messages',
//                   child: Text(
//                     "Started messages",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ),
//                 PopupMenuItem(
//                   value: 'Settings',
//                   child: Text(
//                     "Settings",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ),
//               ];
//             },
//           )
//         ],
//         bottom: TabBar(
//           indicatorColor: Colors.white,
//           controller: _tabController,
//           tabs: myTabs
//               .map((e) => Tab(
//                     child: Text(
//                       "${e['label']}",
//                       style: GoogleFonts.poppins(),
//                     ),
//                   ))
//               .toList(),
//         ),
//       ),
//       drawer: const MyDrawer(),
//       body: TabBarView(
//         controller: _tabController,
//         physics: const BouncingScrollPhysics(),
//         children: const [
//           ChatScreen(),
//           StatusScreen(),
//           CallScreen(),
//         ],
//       ),
//     );
//   }
// }
