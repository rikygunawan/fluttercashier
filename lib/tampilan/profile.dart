import 'package:flutter/material.dart';

class profile_view extends StatelessWidget {
  const profile_view({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const profile(),
    );
  }
}

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _myprofile();
}

class _myprofile extends State<profile> {
  int _clickindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'profile',
            ),
            Text(
              '$_clickindex',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
