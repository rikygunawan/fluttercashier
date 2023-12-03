import 'package:flutter/material.dart';

class report_view extends StatelessWidget {
  const report_view({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const report(),
    );
  }
}

class report extends StatefulWidget {
  const report({super.key});
  @override
  State<report> createState() => _myreport();
}

class _myreport extends State<report> {
  int _clickindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            setState(() {
              _clickindex++;
            });
          }),
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: Text(
            '$_clickindex',
            style: Theme.of(context).textTheme.headline4,
          ),
        ));
  }
}
