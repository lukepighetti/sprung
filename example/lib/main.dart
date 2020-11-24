import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

void main() => runApp(SprungDemoApp());

class SprungDemoApp extends StatefulWidget {
  @override
  _SprungDemoAppState createState() => _SprungDemoAppState();
}

class _SprungDemoAppState extends State<SprungDemoApp> {
  static final title = 'Sprung Demo';

  /// The state map used to handle the animation toggle state for each [_AnimatedTrack].
  final toggleMap = {
    'under': false,
    'critically': false,
    'over': false,
  };

  /// The String/Curve map to build out our example [_AnimatedTrack]s.
  final sprungMap = {
    'under': Sprung.underDamped,
    'critically': Sprung.criticallyDamped,
    'over': Sprung.overDamped,
  };

  /// Toggle a single track based on a key from [sprungMap] and [toggleMap].
  void handleToggle(String e) {
    setState(() {
      toggleMap[e] = !toggleMap[e];
    });
  }

  /// Toggle all tracks in [toggleMap].
  void handleToggleAll() {
    setState(() {
      toggleMap.forEach((key, _) {
        handleToggle(key);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /// App bar
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(Icons.swap_vert),
              onPressed: handleToggleAll,
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              for (var e in sprungMap.entries)

                /// Track
                Expanded(
                  child: _AnimatedTrack(
                    title: e.key,
                    curve: e.value,
                    toggle: toggleMap[e.key],
                    onTap: () => handleToggle(e.key),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedTrack extends StatelessWidget {
  /// A vertical track with animated alignment for a square tappable box with text.
  ///
  /// At the top of the track when [toggle] is true.
  _AnimatedTrack({
    Key key,
    @required this.title,
    @required this.curve,
    this.toggle = false,
    this.onTap,
  }) : super(key: key);

  /// The title to display on this animated track.
  final String title;

  /// The curve to animate with.
  final Curve curve;

  /// The callback to fire when tapping the button in this track.
  final VoidCallback onTap;

  /// If this track is toggled or not.
  final bool toggle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TweenAnimationBuilder(
      tween: Tween(end: toggle ? 1.0 : 0.0),
      curve: curve,
      duration: Duration(milliseconds: 750),
      builder: (context, t, child) {
        return Container(
          margin: EdgeInsets.all(8),
          alignment: Alignment.lerp(
            Alignment.topCenter,
            Alignment.bottomCenter,
            t,
          ),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Material(
              color: theme.primaryColor,
              child: InkWell(
                onTap: onTap,
                child: Center(
                  child: Text(
                    title,
                    style: theme.primaryTextTheme.subtitle2,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
