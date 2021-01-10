import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/services.dart';
import 'species.dart';
import '../pages/common.dart';

class SpeciesInfo extends StatelessWidget {
  final List<Species> species;
  final int speciesId;

  ExpandableController _expandableController = ExpandableController();

  void _expand() {
    _expandableController.expanded = true;
  }

  Future<Map<String, String>> _splitData() async {
    String htmlFile = "assets/speciesdescriptions/" +
        species[this.speciesId].description.toString();
    String htmlData = await rootBundle.loadString(htmlFile);
    Map<String, String> headlinesToRender;

    final headline = htmlData.split('<h4>');
    headlinesToRender = {
      "mainHeadline": headline[0],
      for (int i = 1; i < headline.length; i++)
        headline[i].split('</h4>')[0]:
            headline[i].split('<h4>')[0].split('</h4>')[1].trim()
    };
    return headlinesToRender;
  }

  SpeciesInfo({Key key, this.species, this.speciesId}) : super(key: key);

  Widget categories(headline, data, BuildContext context) {
    return ExpandablePanel(
      header: htmlNormalText("<strong>" + headline + "</strong>", context),
      collapsed: null,
      expanded: htmlNormalText(data, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    _expand();
    return Container(
      child: FutureBuilder(
          future: _splitData(),
          builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
            if (snapshot.data != null) {
              Map<String, String> data = Map.from(snapshot.data);
              var keysList = data.keys.toList();
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  itemCount: data.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return htmlNormalText(data[keysList[index]], context);
                    } else if (index == data.length) {
                      return Divider(height: 35.0, color: Colors.transparent);
                    } else {
                      return categories(
                          keysList[index], data[keysList[index]], context);
                    }
                  });
            }
            return Text("No data found");
          }),
    );
  }
}
