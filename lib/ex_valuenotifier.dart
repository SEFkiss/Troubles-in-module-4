import 'package:flutter/material.dart';

class ExampleValueNotifier extends StatefulWidget {
  const ExampleValueNotifier({Key? key}) : super(key: key);

  @override
  _ExampleValueNotifierState createState() => _ExampleValueNotifierState();
}

class _ExampleValueNotifierState extends State<ExampleValueNotifier> {
  final ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);
  final ValueNotifier<List<int>> arrayNotifier = ValueNotifier<List<int>>([]);
  List<int> array = [];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('BUILD');
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: RaisedButton(
                      child: Text('Counter'),
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      }),
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(child: Text('$counter')),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: RaisedButton(
                      child: Text('Counter Notifier'),
                      onPressed: () {
                        setState(() {
                          counterNotifier.value++;
                        });
                      }),
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ValueListenableBuilder<int>(
                        valueListenable: counterNotifier,
                        builder: (context, value, child) {
                          return Text('${value.toString()}');
                        })),
              ],
            ),
            Divider(),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: RaisedButton(
                      child: Text('Array setState'),
                      onPressed: () {
                        final plusOne = array.length + 1;
                        setState(() {
                          array.add(plusOne);
                        });
                      }),
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ValueListenableBuilder<List<int>>(
                        valueListenable: arrayNotifier,
                        builder: (context, value, child) {
                          return Text('$array');
                        })),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: RaisedButton(
                      child: Text('Array Notifier'),
                      onPressed: () {
                        setState(() {
                          final plusOne = arrayNotifier.value.length + 1;
                          arrayNotifier.value = [
                            ...arrayNotifier.value,
                            plusOne
                          ];
                        });
                      }),
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ValueListenableBuilder<List<int>>(
                        valueListenable: arrayNotifier,
                        builder: (context, value, child) {
                          return Text('$value');
                        })),
              ],
            ),
            const Divider(),
            ExampleNotifier(),
            Profile(),
          ],
        ),
      ),
    );
  }
}

// Этот пример работает и дерево виджетов не обновляется
class ExampleNotifier extends StatelessWidget {
  ExampleNotifier({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Объявляем отслеживаемую "переменную"
    final ValueNotifier<List<int>> array = ValueNotifier([]);
    print('BUILD Example Notifier');
    return Row(
      children: [
        Expanded(
            child: RaisedButton(
                onPressed: () {
                  array.value = [...array.value, array.value.length + 1];
                },
                child: Text('StatelessWidget Value Notifier'))),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: ValueListenableBuilder<List<int>>(
          valueListenable: array,
          builder: (context, value, child) {
            return Text('$value');
          },
        ))
      ],
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    print('BUILD PROFILE');
    return Container(
      child: Text('Profile Widget'),
    );
  }
}
