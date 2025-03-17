import 'package:demo_provider/demo_change_notifier.dart';
import 'package:demo_provider/demo_multiple_provider.dart';
import 'package:demo_provider/demo_value_listenable_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'basic.dart';
import 'package:provider/provider.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        // appBar: AppBar(
        //   title: const Text("Demo Provider"),
        // ),
        body: DemoValueListenableProvider(),
      ),
    );
  }
}
