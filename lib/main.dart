import 'package:belajar_flutter/screenDarkMode.dart';
import 'package:belajar_flutter/screenSekolah.dart';
import 'package:belajar_flutter/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/second-screen': (context) => Secondpage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = 'Flutter Demo Home Page'});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Introduction Page"),
        ),
        body: Column(children: [
          Center(
              child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(Secondpage());
                  },
                  child: Icon(Icons.navigate_next_rounded)),
              ElevatedButton(
                  onPressed: () {
                    Get.to(DarkModePage());
                  },
                  child: Icon(Icons.dark_mode_rounded)),
              ElevatedButton(
                  onPressed: () {
                    Get.to(Screensekolah());
                  },
                  child: Icon(Icons.person)),
            ],
          ))
        ]));
  }
}
