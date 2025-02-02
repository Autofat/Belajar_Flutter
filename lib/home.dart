import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Home Page'),
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        actions: [Icon(Icons.search), Icon(Icons.notifications_active_rounded)],
      ),
      body: Column(
        children: [
          Image.asset('assets/images/logo.png', width: 200),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Name:"),
                    Text("Autofat"),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                print('Button Pressed');
              },
              child: Text('Settings')),
        ],
      ),
    );
  }
}
