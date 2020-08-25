import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calamaria of Borneo',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new MyHomePage(title: 'Calamaria of Borneo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int correctScore = 0;
  int _grUpperLabial = -1;
  int _grLowerLabial = -1;

  bool _eyeLabial2nd = false;
  bool _eyeLabial3rd = false;
  bool _eyeLabial4th = false;

  void _eyeLabial2ndChanged(bool value) =>
      setState(() => _eyeLabial2nd = value);
  void _eyeLabial3rdChanged(bool value) =>
      setState(() => _eyeLabial3rd = value);
  void _eyeLabial4thChanged(bool value) =>
      setState(() => _eyeLabial4th = value);

  void _handleGrUpperLabial(int value) {
    setState(() {
      _grUpperLabial = value;

      switch (_grUpperLabial) {
        case 0:
          correctScore++;
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  void _handleGrLowerLabial(int value) {
    setState(() {
      _grLowerLabial = value;

      switch (_grLowerLabial) {
        case 0:
          break;
        case 1:
          correctScore++;
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String labialscales = 'assets/labialscales.svg';

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        padding: EdgeInsets.all(8.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text('Upper and lower labials (lip scales)',
                  style: Theme.of(context).textTheme.headline5),
              new Divider(height: 15.0, color: Colors.transparent),
              new Text(
                  'Bornean Calamaria have either 4 or 5 (in one species sometimes 6) upper labials (UL), and 4 or 5 lower labials (LL). The tricky part is to judge what are the most posterior of those scales (and not scales named differently). \n\nHere you provide those counts, and enter which of the upper labials are in contact with the eye. Usually two upper labials touch the eye; either the 3rd and 4th, or the 2nd and 3rd. In one species, sometimes only the 3rd UL touches the eye.',
                  style: TextStyle(fontSize: 14)),
              new Divider(height: 15.0, color: Colors.transparent),
              new SvgPicture.asset(
                labialscales,
                color: Colors.black,
                matchTextDirection: false,
              ),
              new Divider(height: 15.0, color: Colors.transparent),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    '# of upper labials:',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _grUpperLabial,
                        onChanged: _handleGrUpperLabial,
                      ),
                      new Text(
                        '4',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: _grUpperLabial,
                        onChanged: _handleGrUpperLabial,
                      ),
                      new Text(
                        '5',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      new Radio(
                        value: 2,
                        groupValue: _grUpperLabial,
                        onChanged: _handleGrUpperLabial,
                      ),
                      new Text(
                        '6',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    '# of lower labials:',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _grLowerLabial,
                        onChanged: _handleGrLowerLabial,
                      ),
                      new Text(
                        '4',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: _grLowerLabial,
                        onChanged: _handleGrLowerLabial,
                      ),
                      new Text(
                        '5',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      new Radio(
                        value: 2,
                        groupValue: _grLowerLabial,
                        onChanged: _handleGrLowerLabial,
                      ),
                      new Text(
                        '6',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    'Which upper\nlabials touch\nthe eye?',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Checkbox(
                          value: _eyeLabial2nd,
                          onChanged: _eyeLabial2ndChanged),
                      new Text(
                        '2nd',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Checkbox(
                          value: _eyeLabial3rd,
                          onChanged: _eyeLabial3rdChanged),
                      new Text(
                        '3rd',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      new Checkbox(
                          value: _eyeLabial4th,
                          onChanged: _eyeLabial4thChanged),
                      new Text(
                        '4th',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
            IconButton(icon: Icon(Icons.delete), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
