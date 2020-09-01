import 'package:calamaria/classes/speciesLikelihood.dart';
import 'package:flutter/foundation.dart';

class Species {
  final int specieId;
  final String scientificName;
  final SpeciesLikelihood likelihood;

  Species({this.specieId, this.scientificName, this.likelihood});


  factory Species.fromJSON(Map<String, dynamic> json) {
    var likelihood = new SpeciesLikelihood(0);
    if(json['id'].toString()=="2") {
      likelihood.upperlabials = 5;
    }
    var species = new Species(
      specieId: json['id'] as int,
      scientificName: json['scientificName'] as String,
      likelihood: likelihood
    );

    return species;
  }

}






/*
Future<String>_loadFromAsset() async {
  return await rootBundle.loadString("assets/species.json");
}

Future parseJson() async {
  string jsonString = await _loadFromAsset();
  final jsonResponse = jsonDecode(jsonString);
}

 */