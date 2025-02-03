import 'package:flutter/material.dart';

class ScreenPendidikan extends StatelessWidget {
  const ScreenPendidikan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pendidikan"),
      ),
      body: Center(
          child: Column(children: [
        Text("Saya adalah seorang mahasiswa"),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
            child: Text("Home Page"))
      ])),
    );
  }
}
