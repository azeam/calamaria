import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../classes/species.dart';
import '../classes/speciesLikelihood.dart';
import 'selectedOptions.dart';
import '../main.dart';

class SpeciesResult extends StatelessWidget {
  List<Species> species;
  final SelectedOptions filter;
  SpeciesResult({Key key, this.species, this.filter}) : super(key: key) {
    //debugPrint('test');
    species.sort((a, b) => (new SpeciesLikelihood(b, this.filter)
            .getPercentage())
        .compareTo((new SpeciesLikelihood(a, this.filter).getPercentage())));
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: species == null ? 0 : species.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
              child: new GestureDetector(
                  child: new Container(
                      child: new Row(
                        children: [
                          Expanded(
                            child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                      species[index].scientificName.toString(),
                                      style: new TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.lightBlueAccent)),
                                ]),
                          ),
                          new SpeciesLikelihood(species[index], this.filter)
                          //species[index].likelihood
                        ],
                      ),
                      padding: const EdgeInsets.all(15.0)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PageSpeciesInfo(species[index].specieId)),
                    );
                  }));
        });
  }
}
