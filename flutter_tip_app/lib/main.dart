import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UTip App'),
      ),
      body: Column(
        children: [
          Container(
          padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: [
                Text('Total tip per Person'),
                Text('\$')
              ],
            )),
        ],
      ),
    );
  }
}
