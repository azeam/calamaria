import 'package:flutter/material.dart';
import 'package:calamaria/svg_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clickable SVG map of The Netherlands',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Clickable SVG map of The Netherlands'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Upperlabial _pressedUpperlabial;

  @override
  Widget build(BuildContext context) {
    /// Calculate the center point of the SVG map,
    /// use parent widget for width/heigth.
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double navBarHeight =
        Theme.of(context).platform == TargetPlatform.android ? 56.0 : 44.0;
    double safeZoneHeight = MediaQuery.of(context).padding.bottom;

    double scaleFactor = 0.5;

    double x = (width / 2.0) - (SvgData.width / 2.0);
    double y = (height / 2.0) -
        (SvgData.height / 2.0) -
        (safeZoneHeight / 2.0) -
        navBarHeight;
    Offset offset = Offset(x, y);

    return Scaffold(
        appBar: AppBar(title: Text('Upperlabials of The Netherlands')),
        body: SafeArea(
            child: Transform.scale(
                scale: ((height / SvgData.height)) * scaleFactor,
                child: Transform.translate(
                    offset: offset, child: Stack(children: _buildMap())))));
  }

  List<Widget> _buildMap() {
    List<Widget> upperlabials = List(Upperlabial.values.length);
    for (int i = 0; i < Upperlabial.values.length; i++) {
      upperlabials[i] = _buildUpperlabial(Upperlabial.values[i]);
    }
    return upperlabials;
  }

  Widget _buildUpperlabial(Upperlabial upperlabial) {
    return ClipPath(
        child: Stack(children: <Widget>[
          CustomPaint(painter: PathPainter(upperlabial)),
          Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () => _upperlabialPressed(upperlabial),
                  child: Container(
                      color: _pressedUpperlabial == upperlabial
                          ? Color(0xFF7C7C7C)
                          : Colors.transparent)))
        ]),
        clipper: PathClipper(upperlabial));
  }

  void _upperlabialPressed(Upperlabial upperlabial) {
    setState(() {
      _pressedUpperlabial = upperlabial;
    });
  }
}

class PathPainter extends CustomPainter {
  final Upperlabial _upperlabial;
  PathPainter(this._upperlabial);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getPathByUpperlabial(_upperlabial);
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.black
          ..strokeWidth = 4.0);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PathPainter oldDelegate) => false;
}

class PathClipper extends CustomClipper<Path> {
  final Upperlabial _upperlabial;
  PathClipper(this._upperlabial);

  @override
  Path getClip(Size size) {
    return getPathByUpperlabial(_upperlabial);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
