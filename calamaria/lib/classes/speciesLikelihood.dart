import 'dart:convert';
import '../classes/species.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'species.dart';
import 'selectedOptions.dart';




class SpeciesLikelihood extends StatelessWidget {
  double percentage;
  Species species;
  SelectedOptions filter;
  Map<String, dynamic> filterData;

  int maxPoints;
  int points;

  List<Map<String, dynamic>> hits = [];
  List<Map<String, dynamic>> misses = [];

  SpeciesLikelihood(this.species, this.filter) {
    filterData = this.filter.toJson();
  }


  int getPercentage() {
    int percentage = 0;
    this.maxPoints = 0;
    this.points = 0;

    this.calculatePoints();

    if(this.points <= 0 || this.maxPoints == 0) {
      return 0;
    } else {
      percentage = (this.points/this.maxPoints*100).toInt();
    }

    return percentage;
  }

  void calculatePoints() {
    //calcPoints(filterData['sUpperLabials'], species.upperLabials);

    //calcPoints(filterData['sLowerLabials'], species.lowerLabials);
    calcPoints(filterData['sULTouchingEye'], species.upperLabialsTouchingEye);

    //calcPoints(filterData['sPreocular'], species.preocular);
    //calcPoints(filterData['sPostocular'], species.postocular);
    //calcPoints(filterData['sPostFused'], species.postocularfused);
    //calcPoints(filterData['sSSEP'], species.ssep);
    //calcPoints(filterData['sEyeDiam'], species.eyeDiameter);
    //calcPoints(filterData['sTail'], species.tail);
    calcPoints(filterData['sMental'], species.mental);

    //calcPoints([filterData['sHemipenes'], filterData['sVents']], species.vents);
    //calcPoints([filterData['sHemipenes'], filterData['sSubcaudals']], species.subcaudals);


  }


  void calcPoints(filter, speciesData, [addToMaxPoints = true]) {
    if(filter == null) {
      return;
    }

    if(speciesData is SpeciesDataEyeDiameter
        || speciesData is SpeciesDataTail
        || speciesData is SpeciesDataSSEP
        || speciesData is SpeciesDataPostocularFused
        || speciesData is SpeciesDataPostocular
        || speciesData is SpeciesDataPreocular
        || speciesData is SpeciesDataMental
        || speciesData is SpeciesDataUpperLabials
        || speciesData is SpeciesDataLowerLabials
        || speciesData is SpeciesDataUpperLabialsTouchingEye
    ) {
      if(speciesData.isHit(filter)) {
        this.points += 10;
        this.hits.add(speciesData.getTableObject(filter, species));
      } else {
        this.misses.add(speciesData.getTableObject(filter, species));
      }
    }

    if(speciesData is SpeciesDataVents || speciesData is SpeciesDataSubcaudals) {
      if(filter[1]==null) {
        return;
      }
      if(filter[0]==null) {
        if (filter[1] >= speciesData.bothMin && filter[1] <= speciesData.bothMax) {
          this.points += 10;
        }
      } else {
        if (!filter[0] && speciesData.femaleMin != null &&
            speciesData.femaleMax != null) {
          if (filter[1] >= speciesData.femaleMin && filter[1] <= speciesData.femaleMax) {
            this.points += 10;
          }
        }
        if (filter[0]) {
          if (filter[1] >= speciesData.maleMin && filter[1] <= speciesData.maleMax) {
            this.points += 10;
          }
        }
      }
    }

    //debugPrint(filter.toString());
    if(addToMaxPoints) {
      this.maxPoints += 10;
    }
  }


  Color getColor() {
    var colors = [
      Color(0xffb5000b),
      Color(0xffb5000b),
      Color(0xffD2222D),
      Color(0xffd25822),
      Color(0xffd28522),
      Color(0xffFFBF00),
      Color(0xffFFBF00),
      Color(0xffd5e615),
      Color(0xffa9c82c),
      Color(0xff6ade14),
      Color(0xff6ade14)
    ];

    return colors[(getPercentage()/10).ceil()];
  }

  Table getTableHits() {
    List<TableRow> rows = [
      new TableRow(
          children: [
            new Container(
                color: Colors.black54,
                padding: EdgeInsets.all(7),
                child: new Text('You picked', style: TextStyle(color: Colors.white))
            ),
            new Container(
                color: Colors.black54,
                padding: EdgeInsets.all(7),
                child: new Text('Species', style: TextStyle(color: Colors.white))
            )
          ]
      )
    ];

    for(var i = 0; i < this.hits.length; i++) {
      rows.add(
        new TableRow(
            children: [
              new Container(
                  padding: EdgeInsets.all(7),
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(this.hits[i]['Picked'], style: TextStyle()),
                    new Text(this.hits[i]['PickedValue'], style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
                )
              ),
              new Container(
                  padding: EdgeInsets.all(7),
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(this.hits[i]['Species'], style: TextStyle()),
                        new Text(this.hits[i]['SpeciesValue'], style: TextStyle(fontWeight: FontWeight.bold)),
                      ]
                  )
              ),
            ]
        )
      );
    }




    return new Table(
      border: TableBorder.all(color: Colors.black54),
      columnWidths: {1: FractionColumnWidth(.5)},
      children: rows,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 60,
        color:  getColor(),
        padding: const EdgeInsets.all(3.0),
        child: new Text(getPercentage().toString()+'%', textAlign: TextAlign.center)
    );
  }
}


