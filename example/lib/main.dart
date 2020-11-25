import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

void main() => runApp(SprungDemoApp());

class SprungDemoApp extends StatefulWidget {
  static final title = 'Sprung';

  @override
  _SprungDemoAppState createState() => _SprungDemoAppState();
}

class _SprungDemoAppState extends State<SprungDemoApp> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: SprungDemoApp.title,
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /// App bar
        appBar: AppBar(
          title: Text(SprungDemoApp.title),
        ),
        body: AnimatedContainer(
          /// Use [Sprung] in place of any curve.
          ///
          /// Opinionated curves are [Sprung.underDamped], [Sprung.criticallyDamped], [Sprung.overDamped].
          /// This is the most common way to use [Sprung].
          ///
          /// If you wish to fine tune the damping action, use `Sprung()` which defaults to `Sprung(20)` and
          /// is the same as [Sprung.criticallyDamped]. Changing the value will fine tune the damping action.
          ///
          /// If you want full control over making custom spring curves, [Sprung.custom] allows you to adjust
          /// damping, stiffness, mass, and velocity.
          ///
          /// ```
          /// Sprung.custom(
          ///   damping: 20,
          ///   stiffness: 180,
          ///   mass: 1.0,
          ///   velocity: 0.0,
          /// )
          /// ```
          curve: Sprung.underDamped,
          duration: Duration(milliseconds: 750),
          alignment: toggle ? Alignment.bottomCenter : Alignment.topCenter,
          margin: EdgeInsets.symmetric(vertical: 50),
          child: RaisedButton(
            child: Text('Tap me!'),
            onPressed: () => setState(() => toggle = !toggle),
          ),
        ),
      ),
    );
  }
}
