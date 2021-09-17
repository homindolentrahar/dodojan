import 'package:flutter/material.dart';

void main() {
  runApp(const DodojanApp());
}

class DodojanApp extends StatelessWidget {
  const DodojanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Dodojan",
      home: Scaffold(
        body: Center(
          child: Text("Dodojan"),
        ),
      ),
    );
  }
}
