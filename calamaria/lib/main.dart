import 'package:calamaria/pages/listSpecies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/idPage.dart';
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
      home: IdPage(1, title: 'Calamaria of Borneo'),
    );
  }
}

class IdPage extends StatefulWidget {
  IdPage(this.page, {Key key, this.title}) : super(key: key);
  final String title;
  final int page;
  @override
  IdPageState createState() => IdPageState();
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
