import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calamaria/classes/species.dart';
import 'package:calamaria/classes/speciesLikelihood.dart';

class SpeciesResult extends StatelessWidget {
  final List<Species> species;
  SpeciesResult({Key key, this.species}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: species == null ? 0 : species.length,
        itemBuilder: (BuildContext context, int index) {
          return
            new Card(
              child: new Container (

                  child: new Row(
                      children: [
                        Expanded(
                          child: new Column (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                species[index].scientificName.toString(),
                                style: new TextStyle(fontSize: 16.0, color: Colors.lightBlueAccent)
                              ),

                            ]
                          ),
                        ),
                        species[index].likelihood
                      ]
                  ),
                  padding: const EdgeInsets.all(15.0)
              ),
            );
        }
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
