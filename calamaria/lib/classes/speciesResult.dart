import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../classes/species.dart';
import '../classes/speciesLikelihood.dart';
import 'selectedOptions.dart';
import '../main.dart';

class SpeciesResult extends StatelessWidget {
  List<Species>? species;
  SelectedOptions? filter;
  SelectedOptions sortfilter = new SelectedOptions();

  SpeciesResult({Key? key, this.species, this.filter}) : super(key: key) {
    this.sortfilter = this.filter ?? new SelectedOptions();
    species?.sort((a, b) => (new SpeciesLikelihood(b, sortfilter).getSort())
        .compareTo((new SpeciesLikelihood(a, sortfilter).getSort())));
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = species?.length ?? 0;
    List<Species> speciesItems = this.species ?? [];

    return new ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          if (speciesItems[index].scientificName != "Calamaria cf. gracillima") {
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
                                      speciesItems[index].scientificName.toString(),
                                      style: new TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.lightBlueAccent,
                                          fontStyle: FontStyle.italic)),
                                ]),
                          ),
                          new SpeciesLikelihood(speciesItems[index], this.sortfilter)
                          //speciesItems[index].likelihood
                        ],
                      ),
                      padding: const EdgeInsets.all(15.0)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageLikelihoodInfo(speciesItems[index],
                            new SpeciesLikelihood(speciesItems[index], this.sortfilter))
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
