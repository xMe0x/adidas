import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: Drawer(),
        /* Icon(icon) */

        title: Text(
          "SHOP",
          style: TextStyle(letterSpacing: 0.5),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 50),
              child: Icon(Icons.person_2_outlined))
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(),
    ));
  }
}
