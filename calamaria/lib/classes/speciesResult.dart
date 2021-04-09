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
    species.sort((a, b) => (new SpeciesLikelihood(b, this.filter).getSort())
        .compareTo((new SpeciesLikelihood(a, this.filter).getSort())));
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: species == null ? 0 : species.length,
        itemBuilder: (BuildContext context, int index) {
          if (species[index].scientificName != "Calamaria cf. gracillima") {
            return new GestureDetector(
                child: new Card(
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
                                          color: Colors.lightBlueAccent,
                                          fontStyle: FontStyle.italic)),
                                ]),
                          ),
                          new SpeciesLikelihood(species[index], this.filter)
                          //species[index].likelihood
                        ],
                      ),
                      padding: const EdgeInsets.all(15.0)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageLikelihoodInfo(species[index],
                            new SpeciesLikelihood(species[index], this.filter))
                        //PageSpeciesInfo(species[index].specieId)
                        ),
                  );
                });
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
