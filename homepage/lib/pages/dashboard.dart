import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/history/history.dart';
import 'package:homepage/pages/dashboard_tabs/notification/notification.dart';
import 'package:homepage/pages/dashboard_tabs/page_dashboard.dart';
import 'package:homepage/pages/dashboard_tabs/profile/profile.dart';

/// This is the stateful widget that the main application instantiates.
class Dashboard extends StatefulWidget {
  Dashboard({Key key, addres}) : super(key: key);
  @override
  _Dashboard createState() => _Dashboard();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Dashboard extends State<Dashboard> {
  final tabs = [
    PageDashboard(),
    NotificationPage(),
    HistoryPage(),
    ProfilePage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/ic_home.png', width: 24),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'images/ic_home.png',
//               width: 24,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage("images/notifikasi.png"),
//             ),
//             label: 'Notifikasi',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage("images/riwayat.png"),
//             ),
//             label: 'Riwayat',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage("images/profile.png"),
//             ),
//             label: 'Profile',
//           ),
//         ],
//         activeColor: Color(0xff008AD5),
//       ),
//       tabBuilder: (context, index) {
//         switch (index) {
//           case 0:
//             return CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(
//                 child: PageDashboard(),
//               );
//             });
//           case 1:
//             return CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(
//                 child: Container(
//                   child: Center(
//                     child: Text("Notifikasi"),
//                   ),
//                 ),
//               );
//             });
//           case 2:
//             return CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(
//                 child: Container(
//                   child: Center(
//                     child: Text("Riwayat"),
//                   ),
//                 ),
//               );
//             });
//           case 3:
//             return CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(
//                 child: Container(
//                   child: Center(
//                     child: Text("Profile"),
//                   ),
//                 ),
//               );
//             });
//           default:
//             return CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(
//                 child: PageDashboard(),
//               );
//             });
//         }
//       },
//     );
//   }
// }
