import 'package:belajar_flutter/controller.dart';
import 'package:belajar_flutter/totalKehadiran.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screensekolah extends StatelessWidget {
  const Screensekolah({super.key});

  Controller get c => Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sekolah Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              "Kehadiran Siswa",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(Icons.timer_sharp),
                ),
                GestureDetector(
                  onTap: () {
                    c.addKehadiranSiswa();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Obx(() => Text("${c.siswa.toString()}")),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    c.removeKehadiranSiswa();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.remove),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Kehadiran Guru", style: TextStyle(fontSize: 20)),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(Icons.timer_sharp),
                ),
                GestureDetector(
                  onTap: () {
                    c.addKehadiranGuru();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Obx(() => Text("${c.guru.toString()}")),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    c.removeKehadiranGuru();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.remove),
                  ),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(TotalKehadiran());
                },
                child: Text("Total Kehadiran"))
          ],
        ),
      ),
    );
  }
}
