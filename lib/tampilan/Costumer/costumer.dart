import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/tampilan/Costumer/costumeradd.dart';
import 'package:http/http.dart' as http;

class costumerview extends StatefulWidget {
  const costumerview({Key? key}) : super(key: key);

  @override
  State<costumerview> createState() => _costumerStateview();
}

class _costumerStateview extends State<costumerview> {
  List _listdata = [];

  Future _getdata() async {
    try {
      final Response = await http
          .get(Uri.parse('http://192.168.1.55/flutterapi/skycashier/read.php'));
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

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Costumer List"),
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
                title: Text(_listdata[index]['nama']),
                subtitle: Text(_listdata[index]['alamat']),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => costumeraddview(),
            ),
          );
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
