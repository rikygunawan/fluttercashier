import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/tampilan/Costumer/costumer.dart';
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
    final Response = await http.post(
        Uri.parse("http://192.168.1.55/flutterapi/skycashier/insert.php"),
        body: {
          "nama": nama.text,
          "nomorhp": nomorhp.text,
          "alamat": alamat.text,
        });
    if (Response.statusCode == 200) {
      return true;
    }
    return false;
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
                      _simpan().then((value) {
                        if (value) {
                          final snackbar = SnackBar(
                            content: const Text("Berhasil di simpan"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        } else {
                          final snackbar = SnackBar(
                            content: const Text("Berhasil di simpan"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                      });

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const costumerview()),
                      // );
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => costumerview())),
                      //     (route) => false);
                    }
                    nama.clear();
                    nomorhp.clear();
                    alamat.clear();
                  },
                  child: Text('Simpan')),
            ]),
          )),
    );
  }
}
