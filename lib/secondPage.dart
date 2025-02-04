import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(children: [
          Text("Second Page"),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Icon(Icons.home_filled))
        ]),
      ),
    );
  }
}
