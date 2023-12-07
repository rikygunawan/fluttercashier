import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class costumeraddview extends StatefulWidget {
  const costumeraddview({Key? key}) : super(key: key);

  @override
  State<costumeraddview> createState() => _costumeraddviewState();
}

class _costumeraddviewState extends State<costumeraddview> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController nomorhp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  Future _simpan() async {
    final respone = await http
        .post(Uri.parse("http://192.168.1.55/flutterapi/skycashier/read.php"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Costumer Add"),
      ),
      body: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                    hintText: 'Nama',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama Tidak Boleh Kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nomorhp,
                decoration: InputDecoration(
                    hintText: 'Nomor HP',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: alamat,
                decoration: InputDecoration(
                    hintText: 'Alamat',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _simpan();
                    }
                  },
                  child: Text('Simpan')),
            ]),
          )),
    );
  }
}
