import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/tampilan/Costumer/costumer.dart';
import 'package:http/http.dart' as http;

class pelayananaddview extends StatefulWidget {
  const pelayananaddview({Key? key}) : super(key: key);

  @override
  State<pelayananaddview> createState() => _pelayananaddviewState();
}

class _pelayananaddviewState extends State<pelayananaddview> {
  final formKey = GlobalKey<FormState>();
  TextEditingController jenislayanan = TextEditingController();
  TextEditingController harga = TextEditingController();
  Future _simpan() async {
    final Response = await http.post(
        Uri.parse(
            "http://192.168.1.55/flutterapi/skycashier/insertpelayanan.php"),
        body: {
          "jenislayanan": jenislayanan.text,
          "harga": harga.text,
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
                controller: jenislayanan,
                decoration: InputDecoration(
                    hintText: 'Jenis Layanan',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Jenis Layanan Tidak Boleh Kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: harga,
                decoration: InputDecoration(
                    hintText: 'Harga',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 10,
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
                    jenislayanan.clear();
                    harga.clear();
                  },
                  child: Text('Simpan')),
            ]),
          )),
    );
  }
}
