import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'species.dart';
import '../pages/common.dart';

class SpeciesInfo extends StatelessWidget {
  final List<Species> species;
  final int speciesId;

  ExpandableController _expandableController = ExpandableController();

  void _expand() {
    _expandableController.expanded = true;
  }

  SpeciesInfo({Key key, this.species, this.speciesId}) : super(key: key);

  List<Widget> categories(data, BuildContext context) {
    List<Widget> children = [];
    children.add(htmlNormalText(
        "<h2><i>" + data.scientificName + "</i> " + data.author + "</h2>",
        context));
    data.description.keys.forEach(
      (key) => {
        children.add(
          ExpandablePanel(
            controller: children.length == 1
                ? _expandableController
                : null, // expand first category by default TODO: not sure if wanted, otherwise remove all expand/-controller
            header: htmlNormalText("<strong>" + key + "</strong>", context),
            collapsed: null,
            expanded: htmlNormalText('${data.description[key]}', context),
          ),
        )
      },
    );
    children.add(Divider(height: 35.0, color: Colors.transparent));

    return children;
  }

  @override
  Widget build(BuildContext context) {
    _expand();
    return ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        children: categories(species[this.speciesId], context));
  }
}
