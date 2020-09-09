import 'package:calamaria/pages/listSpecies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/idPage1.dart';
import 'pages/idPage2.dart';
import 'pages/idPage3.dart';
import 'pages/idPage4.dart';
import 'pages/idPage5.dart';
import 'pages/idPage6.dart';
import 'pages/idPage7.dart';
import 'pages/idPage8.dart';
import 'pages/infoPage.dart';

void main() => runApp(Calamaria());

class Calamaria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calamaria of Borneo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: IdPage1(title: 'Calamaria of Borneo'),
    );
  }
}

class IdPage1 extends StatefulWidget {
  IdPage1({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState1 createState() => IdPageState1();
}

class IdPage2 extends StatefulWidget {
  IdPage2({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState2 createState() => IdPageState2();
}

class IdPage3 extends StatefulWidget {
  IdPage3({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState3 createState() => IdPageState3();
}

class IdPage4 extends StatefulWidget {
  IdPage4({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState4 createState() => IdPageState4();
}

class IdPage5 extends StatefulWidget {
  IdPage5({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState5 createState() => IdPageState5();
}

class IdPage6 extends StatefulWidget {
  IdPage6({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState6 createState() => IdPageState6();
}

class IdPage7 extends StatefulWidget {
  IdPage7({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState7 createState() => IdPageState7();
}

class IdPage8 extends StatefulWidget {
  IdPage8({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState8 createState() => IdPageState8();
}

class PageListSpecies extends StatefulWidget {
  PageListSpecies({Key key, this.title}) : super(key: key);
  final String title;
  @override
  PageState_ListSpecies createState() => PageState_ListSpecies();
}

class InfoPage extends StatefulWidget {
  InfoPage(this.page, {Key key, this.title}) : super(key: key);
  final String title;
  final String page;
  @override
  InfoPageState createState() => InfoPageState();
}
