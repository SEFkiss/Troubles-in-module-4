import 'package:flutter/material.dart';
import 'package:stateful_widget/ex_valuenotifier.dart';
// import 'package:stateful_widget/ex_stateless.dart';
// import 'package:stateful_widget/ex_lifecycle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ExampleLifecycle(),
      // home: ExampleObserver(),
      home: ExampleValueNotifier(),
      // home: ExampleStateless(),
      // home: ExampleKeys(),
    );
  }
}
