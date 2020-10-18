import 'package:photo_view/photo_view.dart';

import 'pages/fullScreenImg.dart';
import 'pages/listSpecies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/idPage.dart';
import 'pages/infoPage.dart';
import 'pages/speciesInfoPage.dart';
import 'classes/selectedOptions.dart';

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
  //PageListSpecies(this.filter, {Key key, this.title}) : super(key: key);
  SelectedOptions filter;

  PageListSpecies([this.filter]) {}
  //final String title;

  @override
  PageState_ListSpecies createState() => PageState_ListSpecies(filter);
}

class InfoPage extends StatefulWidget {
  InfoPage(this.page, {Key key, this.title}) : super(key: key);
  final String title;
  final int page;
  @override
  InfoPageState createState() => InfoPageState();
}

class PageSpeciesInfo extends StatefulWidget {
  PageSpeciesInfo(this.speciesId, {Key key, this.title}) : super(key: key);
  final int speciesId;
  final String title;
  @override
  PageState_SpeciesInfoPage createState() =>
      PageState_SpeciesInfoPage(speciesId);
}

class FullScreenImage extends StatefulWidget {
  FullScreenImage({Key key, this.photoUrl}) : super(key: key);
  final String photoUrl;
  @override
  FullScreenImageState createState() => FullScreenImageState();
}
