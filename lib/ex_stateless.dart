import 'package:flutter/material.dart';

class ExampleStateless extends StatefulWidget {
  const ExampleStateless({Key? key}) : super(key: key);
  @override
  _ExampleStatelessState createState() => _ExampleStatelessState();
}

class _ExampleStatelessState extends State<ExampleStateless> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              UserCard(age: 12, name: 'John'),
              UserCard(age: 112, name: 'Eric'),
              UserCard(age: 14, name: 'Thomas'),
              UserCard(age: 23, name: 'Nick'),
            ],
          ),
        ));
  }
}

class UserCard extends StatelessWidget {
  UserCard({Key? key, this.name, this.age}) : super(key: key);

  final int? age;
  final String? name;

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.green[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('$name'),
                Text('$age'),
              ],
            )));
  }
}
