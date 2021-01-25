import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'species.dart';
import '../pages/common.dart';

class SpeciesInfo extends StatelessWidget {
  final List<Species> species;
  final int speciesId;

  Future<Map<String, String>> _splitData() async {
    String htmlFile = "assets/speciesdescriptions/" +
        species[this.speciesId].description.toString();
    String htmlData = await rootBundle.loadString(htmlFile);
    Map<String, String> headlinesToRender;

    final headline = htmlData.split('[section]');
    headlinesToRender = {
      "": "", // empty index for title listview, better to set from json in build
      for (int i = 1; i < headline.length; i++)
        headline[i].split('[/section]')[0]:
            headline[i].split('[section]')[0].split('[/section]')[1].trim()
    };
    return headlinesToRender;
  }

  SpeciesInfo({Key key, this.species, this.speciesId}) : super(key: key);

  Widget categories(headline, data, BuildContext context) {
    return ListTileTheme(
        key: PageStorageKey(
            headline), // required to not auto collapse outside view
        contentPadding: EdgeInsets.all(0),
        child: ExpansionTile(
            maintainState: true,
            title: htmlNormalText(
                "<p><strong>" + headline + "</strong></p>", context),
            children: [htmlNormalText(data, context)]));
  }

  @override
  Widget build(BuildContext context) {
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
                      return Text.rich(TextSpan(children: [
                        WidgetSpan(
                          child: Container(
                              padding:
                                  EdgeInsets.only(top: 24, left: 8, bottom: 24),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: species[this.speciesId]
                                            .scientificName
                                            .toString() +
                                        " ",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontStyle: FontStyle.italic)),
                                TextSpan(
                                    text: species[this.speciesId]
                                        .author
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFeatures: [
                                          FontFeature.enable('smcp')
                                        ]))
                              ]))),
                        )
                      ]));
                    } else if (index == data.length) {
                      return Divider(height: 35.0, color: Colors.transparent);
                    } else {
                      return categories(
                          keysList[index], data[keysList[index]], context);
                    }
                  });
            }
            return loading(context);
          }),
    );
  }
}
