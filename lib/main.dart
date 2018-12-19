import 'package:flutter/material.dart';
import 'dart:math' as Math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sprung Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Sprung Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isOffset = false;

  void _toggleOffset() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      this._isOffset = !this._isOffset;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _toggleOffset method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(24.0),

        child: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;

            return AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Sprung(),
              margin: EdgeInsets.only(
                top: this._isOffset ? height - 200.0 : 100.0,
              ),
              height: 100.0,
              width: 100.0,
              color: Colors.pinkAccent,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleOffset,
        tooltip: 'Animated',
        child: Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

///
///
///

class Sprung extends Curve {
  Sprung();

  @override
  double transform(double t) {
    // final sqrt = Math.sqrt;
    // final e = Math.exp;

    // final m = 1;
    // final k = 180;
    // final c = 20;

    // final ckm = sqrt(c * c - 4 * k * m);
    // final mcm = m - (c / m);

    // final first = (1 / (2 * ckm)) * c * (-e(1 / 2 * t) * (-ckm / mcm));
    // final second = c * e(1 / 2 * t * (ckm / mcm));
    // final third = ckm * e(1 / 2 * t * (-ckm / mcm));
    // final fourth = ckm * e(1 / 2 * t * (ckm / mcm));
    // final fifth = 2 * ckm;

    // final result = -first + second + third + fourth - fifth;

    // print(result);
    // return result;

    final pow = Math.pow;
    final sin = Math.sin;
    final cos = Math.cos;

    f(t) =>
        -0.5 *
        pow(2.71828, (-6 * t)) *
        (-2 * pow(2.71828, (6 * t)) + sin(12 * t) + 2 * cos(12 * t));

    return f(t);
  }
}

// f(double t) => t.toStringAsFixed(2);

// this.distance = 100,
// duration,
// this.friction = 0.2,
// this.mass = 1,
// this.spring = 0.5,
// }) : this.duration = Duration(milliseconds: 300);

// final k = spring;
// final x = distance;
// final m = mass;
// final u = spring;
// final dt = duration.inMilliseconds / 1000;

// f(t) => ((k * (x * (1 - t)) / m) - u) * (dt * dt) / 2;

// final result = 1 - f(t) / f(0.0);

// print([k, x, m, u, dt, result]);

// return result;
