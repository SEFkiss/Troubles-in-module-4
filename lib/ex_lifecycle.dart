import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ExampleNew extends StatefulWidget {
  const ExampleNew({Key? key}) : super(key: key);
  @override
  _ExampleNewState createState() => _ExampleNewState();
}

class _ExampleNewState extends State<ExampleNew> {
  @override
  void initState() {
    super.initState();
    print("Initialization");
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD WIDGET');
    return Scaffold(
      // appBar: AppBar(),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}

class ExampleLifecycle extends StatefulWidget {
  const ExampleLifecycle({Key? key}) : super(key: key);

  @override
  _ExampleLifecycleState createState() => _ExampleLifecycleState();
}

class _ExampleLifecycleState extends State<ExampleLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print("Приложение ушло в фоновый режим");
    }
    if (state == AppLifecycleState.resumed) {
      print("Приложение вышло из ФОНА");
    }
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(onPressed: () {
            setState(() {
              counter++;
            });
          }),
          if (counter < 5) CounterWidget(counter: counter),
        ],
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, this.counter}) : super(key: key);
  final int? counter;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  void initState() {
    super.initState();
    print("INIT STATE");
    print("");

    // addPostFrameCallback
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      print("POST FRAME CALLBACK");
      print("brightness: ${Theme.of(context).brightness}");
      print("");
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("DID CHANGE DEPEN");
    print("width screen: ${MediaQuery.of(context).size.width}");
    print("");
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    return Center(
      child: Column(
        children: <Widget>[
          Container(child: Text('Counter ${widget.counter}')),
          HomeViewCounter(counter: widget.counter),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("did Update Widget: $oldWidget");
    print("Old counter ${oldWidget.counter}");
    print("");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("DIACTIVATE");
  }

  @override
  void dispose() {
    super.dispose();
    print("DISPOSE");
  }
}

class HomeViewCounter extends StatelessWidget {
  HomeViewCounter({Key? key, this.counter}) : super(key: key);
  final int? counter;

  @override
  Widget build(BuildContext context) {
    print('BUILD COUNTER WIDGET');
    print("");
    return Text('Stateless widget counter: $counter');
  }
}
