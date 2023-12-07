import 'package:flutter/material.dart';
import 'package:flutter_application_1/tampilan/home.dart';
import 'package:flutter_application_1/tampilan/profile.dart';
import 'package:flutter_application_1/tampilan/report.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _clickindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _clickindex,
        children: [home_view(), report_view(), profile_view()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _clickindex,
        items: [
          BottomNavigationBarItem(
              label: 'Dashboard', icon: Icon(Icons.dashboard)),
          BottomNavigationBarItem(label: 'Report', icon: Icon(Icons.list)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
        ],
        onTap: (index) {
          setState(() {
            _clickindex = index;
          });
        },
      ),
    );
  }
}
