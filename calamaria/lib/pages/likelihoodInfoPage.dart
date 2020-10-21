import 'dart:convert';
import 'package:flutter/material.dart';
import '../classes/species.dart';
import '../classes/speciesLikelihood.dart';
//import 'package:calamaria/classes/speciesList.dart';
//import 'package:calamaria/classes/speciesResult.dart';
//import '../classes/speciesInfo.dart';
import '../main.dart';

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
      body: Container(
          child: new Container(
              padding: const EdgeInsets.all(15.0),
              child: new Container(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(
                            species.scientificName,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                        ),
                        new Text(
                            'Probability: '+speciesLikelihood.getPercentage().toString()+' %',
                            style: TextStyle(fontSize: 14)
                        ),


                        new Container(
                          margin: new EdgeInsets.only(top: 20.0),
                          child: new Text(
                              'Hits',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                          ),
                        ),
                        speciesLikelihood.getTableHits(),
                        new Container(
                          margin: new EdgeInsets.only(top: 20.0),
                          child: new Text(
                              'Misses',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                          ),
                        ),

                      ]
                  )
              )
          )
      ),
      //bottomNavigationBar: navBar(context),
      //floatingActionButton: navFAB(context, SecondIdPage()),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

}
