import 'package:flutter/material.dart';
import 'package:flutter_application_1/tampilan/home.dart';
import 'package:flutter_application_1/tampilan/profile.dart';
import 'package:flutter_application_1/tampilan/report.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _clickindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _clickindex,
        children: [home_view(), report_view(), profile_view()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _clickindex,
        items: [
          BottomNavigationBarItem(label: 'home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'report', icon: Icon(Icons.list)),
          BottomNavigationBarItem(label: 'profile', icon: Icon(Icons.person)),
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
