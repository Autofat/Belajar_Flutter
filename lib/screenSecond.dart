import 'package:belajar_flutter/pengalamanScreen.dart';
import 'package:flutter/material.dart';

class ScreenSecondPage extends StatefulWidget {
  const ScreenSecondPage({super.key});

  @override
  State<ScreenSecondPage> createState() => _ScreenSecondPageState();
}

class _ScreenSecondPageState extends State<ScreenSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Nama Saya Neo"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(builder: (context) {
                      return ScreenPengalaman();
                    }));
                  },
                  child: Text("Lihat Pengalaman")),
              Text("Pendidikan"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed('/screen-pendidikan');
                  },
                  child: Text("Lihat Pendidikan")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Back"))
            ],
          ),
        ));
  }
}
