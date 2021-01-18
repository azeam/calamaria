import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes/species.dart';
//import 'package:calamaria/classes/speciesList.dart';
//import 'package:calamaria/classes/speciesResult.dart';
import '../classes/speciesInfo.dart';
import '../main.dart';
import 'common.dart';

class PageState_SpeciesInfoPage extends State<PageSpeciesInfo> {
  final int speciesId;
  List<Species> species;
  PageState_SpeciesInfoPage(this.speciesId);
  String title = "Loading...";

  void initState() {
    super.initState();
    loadJson();
  }

  // load everything on init and set state in order to get species name for title + species list to pass as arg
  // instead of using multiple futurebuilders
  loadJson() async {
    String data = await rootBundle.loadString('assets/species.json');
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    species = parsed.map<Species>((json) => Species.fromJSON(json)).toList();
    title = species[this.speciesId].scientificName.toString();
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: htmlAppTitle("<i>" + title + "</i>")),
      body: Container(
        child: Center(
            child: species != null
                ? SpeciesInfo(species: species, speciesId: this.speciesId)
                : loading(context)),
      ),
      bottomNavigationBar: navBar(context, 1),
    );
  }
}
