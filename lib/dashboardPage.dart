import 'package:flutter/material.dart';
import 'MainAppBar.dart';
import 'page.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: ChatPage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 233, 107, 23),
        child: Icon(Icons.message),
        onPressed: () {},
      ),
    );
  }
}
