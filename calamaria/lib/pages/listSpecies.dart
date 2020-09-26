import 'dart:convert';
import '../classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import '../classes/species.dart';
import '../classes/speciesList.dart';
import '../classes/speciesResult.dart';
import 'speciesInfoPage.dart';
import '../main.dart';

class PageState_ListSpecies extends State<PageListSpecies> {
  final SelectedOptions filter;
  PageState_ListSpecies(this.filter);

  @override
  Widget build(BuildContext context) {
    //debugPrint(this.filter);
    return Scaffold(
      appBar: AppBar(
        title: Text('List species'),
      ),
      body: Container(
        child: new Center(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/species.json'),
                builder: (context, snapshot) {
                  List<Species> species = parseJson(snapshot.data);
                  return species.isNotEmpty
                      ? ((this.filter != null)
                          ? new SpeciesResult(
                              species: species, filter: this.filter)
                          : new SpeciesList(species: species))
                      : new Center(child: new CircularProgressIndicator());
                })),
      ),
      //bottomNavigationBar: navBar(context),
      //floatingActionButton: navFAB(context, SecondIdPage()),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  List<Species> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Species>((json) => new Species.fromJSON(json)).toList();
  }
}
