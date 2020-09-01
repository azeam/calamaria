import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calamaria/classes/species.dart';

class SpeciesList extends StatelessWidget {
  final List<Species> species;
  SpeciesList({Key key, this.species}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: species == null ? 0 : species.length,
      itemBuilder: (BuildContext context, int index) {
        return
          new Card(
            child: new Container (
              child: new Center(
                child: new Column (
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Text(
                        species[index].scientificName.toString(),
                      style: new TextStyle(fontSize: 16.0, color: Colors.lightBlueAccent)
                    ),

                  ]
                )
              ),
              padding: const EdgeInsets.all(15.0)
            ),
          );
      }
    );
  }

}
