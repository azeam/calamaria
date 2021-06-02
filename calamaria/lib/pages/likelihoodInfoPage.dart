import 'dart:convert';
import 'package:flutter/material.dart';
import '../classes/species.dart';
import '../classes/speciesLikelihood.dart';
//import 'package:calamaria/classes/speciesList.dart';
//import 'package:calamaria/classes/speciesResult.dart';
//import '../classes/speciesInfo.dart';
import '../main.dart';
import 'common.dart';

class PageState_LikelihoodInfoPage extends State<PageLikelihoodInfo> {
  final Species species;
  final SpeciesLikelihood speciesLikelihood;
  PageState_LikelihoodInfoPage(this.species, this.speciesLikelihood);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: new Container(
                padding: const EdgeInsets.all(15.0),
                child: new Container(
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 6,
                                child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      new Container(
                                          child: new Text(
                                              species.scientificName,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FontStyle.italic))),
                                      new Text(
                                          'Hits: ' +
                                              speciesLikelihood
                                                  .getPercentage()
                                                  .toString() +
                                              ' %',
                                          style: TextStyle(fontSize: 14))
                                    ])),
                            Expanded(
                                flex: 4,
                                child: new Container(
                                  alignment: Alignment.topRight,
                                  child: new FlatButton(
                                    color: Colors.lightGreen,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PageSpeciesInfo(
                                                    species.specieId)),
                                      );
                                    },
                                    child: Text("Species account"),
                                  ),
                                )),
                          ]),
                      new Container(
                          margin: new EdgeInsets.only(top: 20.0),
                          child: speciesLikelihood.getUncertains()
                      ),
                      new Container(
                          margin: new EdgeInsets.only(top: 20.0),
                          child: speciesLikelihood.getWarnings()
                      ),
                      new Container(
                        margin: new EdgeInsets.only(top: 20.0),
                        child: new Text('Misses',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      speciesLikelihood.getTableMisses(),
                      new Container(
                        margin: new EdgeInsets.only(top: 20.0),
                        child: new Text('Hits',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      speciesLikelihood.getTableHits(),
                    ])))),
      ),
      bottomNavigationBar: navBar(context, 1),
    );
  }
}
