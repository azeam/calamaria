import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'species.dart';

class SpeciesInfo extends StatelessWidget {
  final List<Species> species;
  final int speciesId;
  SpeciesInfo({Key key, this.species, this.speciesId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(15.0),
      child: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(
                species[this.speciesId].scientificName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              new Image.asset('assets/speciesimages/'+species[this.speciesId].image),
              new Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: new Text(
                      species[this.speciesId].description,
                )
              )
            ]
        )
      )
    );


  }


  List<Species> parseJson(String response) {
    if(response == null) {
      return [];
    }
    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Species>((json) => new Species.fromJSON(json)).toList();
  }
}
