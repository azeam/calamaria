import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/fullScreenImg.dart';
import 'pages/listSpecies.dart';
import 'pages/idPage.dart';
import 'pages/infoPage.dart';
import 'pages/speciesInfoPage.dart';
import 'pages/likelihoodInfoPage.dart';

import 'classes/selectedOptions.dart';
import 'classes/species.dart';
import 'classes/speciesLikelihood.dart';

void main() => runApp(Calamaria());

final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

class Calamaria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // TODO: for debugging, can be removed later
      navigatorObservers: <NavigatorObserver>[routeObserver],
      title: 'Calamaria of Borneo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: InfoPage(page: 12),
    );
  }
}

class IdPage extends StatefulWidget {
  IdPage({Key key, this.title, this.page}) : super(key: key);
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
  InfoPage({Key key, this.page}) : super(key: key);
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

class PageLikelihoodInfo extends StatefulWidget {
  PageLikelihoodInfo(this.species, this.speciesLikelihood);
  final Species species;
  final SpeciesLikelihood speciesLikelihood;

  @override
  PageState_LikelihoodInfoPage createState() =>
      PageState_LikelihoodInfoPage(species, speciesLikelihood);
}

class FullScreenImage extends StatefulWidget {
  FullScreenImage({Key key, this.photoUrl, this.title}) : super(key: key);
  final String photoUrl;
  final String title;
  @override
  FullScreenImageState createState() => FullScreenImageState();
}
