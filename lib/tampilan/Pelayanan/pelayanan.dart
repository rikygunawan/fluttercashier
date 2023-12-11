import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/tampilan/Pelayanan/pelayananadd.dart';
import 'package:http/http.dart' as http;

class pelayananview extends StatefulWidget {
  const pelayananview({Key? key}) : super(key: key);

  @override
  State<pelayananview> createState() => _pelayananviewState();
}

class _pelayananviewState extends State<pelayananview> {
  @override
  List _listdata = [];

  Future _getdata() async {
    try {
      final Response = await http.get(Uri.parse(
          'http://192.168.1.55/flutterapi/skycashier/readpelayanan.php'));
      if (Response.statusCode == 200) {
        final data = jsonDecode(Response.body);
        setState(() {
          _listdata = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    _getdata();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pelayanan List"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: _listdata.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(_listdata[index]['jenislayanan']),
                trailing: Text(_listdata[index]['harga']),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pelayananaddview(),
            ),
          );
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
