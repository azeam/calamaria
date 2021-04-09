import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../classes/species.dart';
import '../main.dart';

class SpeciesList extends StatelessWidget {
  final List<Species> species;
  SpeciesList({Key key, this.species}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: species == null ? 0 : species.length,
        itemBuilder: (BuildContext context, int index) {
          if (species[index].scientificName != "Calamaria cf. gracillima") {
            return new Card(
                child: new GestureDetector(
                    child: new Container(
                        child: new Center(
                            child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                              new Text(species[index].scientificName.toString(),
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.lightBlueAccent,
                                      fontStyle: FontStyle.italic)),
                            ])),
                        padding: const EdgeInsets.all(15.0)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageSpeciesInfo(index)),
                      );
                    }));
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
