import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static MaterialPage page() {
    return const MaterialPage(
      key: ValueKey(HomePage),
      child: HomePage(),
      name: "/home"
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text( "Hello"),
    );
  }
}