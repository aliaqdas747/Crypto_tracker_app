import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
child: Center(child: Text('\n* * * * * * * * * *\n* * * * * * * * *\n* * * * * * * *\n alBasti*\n* * * * * * * *\n* * * * * * * * *\n* * * * * * * * * *',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),)),
        ),
      ),
    );
  }
}
