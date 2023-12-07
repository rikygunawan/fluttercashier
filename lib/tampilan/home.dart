import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tampilan/Costumer/costumer.dart';

class home_view extends StatelessWidget {
  const home_view({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const home(),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _myhome();
}

class _myhome extends State<home> {
  int _clickindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (() {}),
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.add_home_work,
                      size: 50,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      ' Edit Jasa \nPelayanan',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (() {}),
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.note_add,
                      size: 50,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      'Transaksi',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const costumerview()),
                );
              }),
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.person_pin,
                      size: 50,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      'Costumer',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Column(
      //       children: [
      //         Container(
      //           height: 200.0,
      //           decoration: const BoxDecoration(
      //             image: DecorationImage(
      //               image: AssetImage('assets/icon/bg.jpg'),
      //               fit: BoxFit.fill,
      //             ),
      //             borderRadius: BorderRadius.all(
      //               Radius.circular(
      //                 16.0,
      //               ),
      //             ),
      //           ),
      //         ),
      //         Card(
      //           margin: const EdgeInsets.all(8),
      //           child: InkWell(
      //             onTap: (() {}),
      //             splashColor: Colors.blue,
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: const <Widget>[
      //                 Icon(
      //                   Icons.home,
      //                   size: 50,
      //                   color: Colors.blueAccent,
      //                 ),
      //                 Text(
      //                   'Transaksi',
      //                   style: TextStyle(fontSize: 15),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
