import 'package:belajar_flutter/pendidikanScreen.dart';
import 'package:belajar_flutter/screenSecond.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/screen-second': (context) => ScreenSecondPage(),
        '/screen-pendidikan': (context) => ScreenPendidikan(),
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
      body: Center(
        child: Column(
          children: [
            Text("Pengenalan Diri"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenSecondPage()));
                },
                child: Text("Next Page"))
          ],
        ),
      ),
    );
  }
}
