import 'package:flutter/material.dart';

class ScreenPengalaman extends StatelessWidget {
  const ScreenPengalaman({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengalaman"),
      ),
      body: Center(
        child: Text("Saya adalah seorang developer junior"),
      ),
    );
  }
}
