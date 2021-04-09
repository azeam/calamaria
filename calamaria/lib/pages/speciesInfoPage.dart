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
    this.species =
        parsed.map<Species>((json) => Species.fromJSON(json)).toList();
    this.title = this.species[this.speciesId].scientificName.toString() ==
            "Calamaria cf. gracillima"
        ? "<i>Calamaria</i> " + "cf. " + "<i>gracillima</i>"
        : "<i>" +
            this.species[this.speciesId].scientificName.toString() +
            "</i>";
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: htmlAppTitle(this.title)),
      body: Container(
        child: Center(
            child: species != null
                ? SpeciesInfo(species: this.species, speciesId: this.speciesId)
                : loading(context)),
      ),
      bottomNavigationBar: navBar(context, 1),
    );
  }
}
