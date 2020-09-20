import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:calamaria/classes/species.dart';
//import 'package:calamaria/classes/speciesList.dart';
//import 'package:calamaria/classes/speciesResult.dart';
import 'package:calamaria/classes/speciesInfo.dart';
import '../main.dart';

class PageState_SpeciesInfoPage extends State<PageSpeciesInfo> {
  final int speciesId;
  PageState_SpeciesInfoPage(this.speciesId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Species info'),
      ),
      body: Container(
        child: new Center(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('assets/species.json'),
                builder: (context, snapshot) {
                  List<Species> species = parseJson(snapshot.data);
                  return species.isNotEmpty
                      ? new SpeciesInfo(species: species, speciesId: this.speciesId)
                      : new Center(child: new CircularProgressIndicator());
                }
            )
        ),
      ),
      //bottomNavigationBar: navBar(context),
      //floatingActionButton: navFAB(context, SecondIdPage()),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );


  }

  List<Species> parseJson(String response) {
    if(response == null) {
      return [];
    }
    final parsed = json.decode(response).cast<Map<String, dynamic>>();
    return parsed.map<Species>((json) => new Species.fromJSON(json)).toList();
  }
}
