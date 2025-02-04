import 'package:belajar_flutter/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalKehadiran extends StatelessWidget {
  TotalKehadiran({super.key});

  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Total"),
      ),
      body: Center(
        child: Column(
          children: [Text("Total Kehadiran sekolah"), Text("${c.sumTotal()}")],
        ),
      ),
    );
  }
}
