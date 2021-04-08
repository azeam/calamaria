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
  List<String> uncertains = [];

  SpeciesLikelihood(this.species, this.filter) {
    filterData = this.filter.toJson();
  }


  int getPercentage() {
    int percentage = 0;
    this.maxPoints = 0;
    this.points = 0;

    this.calculatePoints();
    //debugPrint('POINTS:'+this.points.toString());
    //debugPrint('MAX-POINTS:'+this.maxPoints.toString());
    if(this.points <= 0 || this.maxPoints == 0) {
      return 0;
    } else {
      percentage = (this.points/this.maxPoints*100).toInt();
    }

    return percentage;
  }

  int getSort() {
    int isAnyUncertain = (this.isAnyUncertain()) ? 1 : 0;
    return this.getPercentage()+isAnyUncertain;
  }

  void calculatePoints() {
    calcPoints(filterData['sUpperLabials'], species.upperLabials);

    calcPoints(filterData['sLowerLabials'], species.lowerLabials);
    calcPoints(filterData['sULTouchingEye'], species.upperLabialsTouchingEye);

    calcPoints(filterData['sPreocular'], species.preocular);
    calcPoints(filterData['sPostocular'], species.postocular);
    calcPoints(filterData['sPostFused'], species.postocularfused);
    calcPoints(filterData['sSSEP'], species.ssep);
    calcPoints(filterData['sEyeDiam'], species.eyeDiameter);
    calcPoints(filterData['sTail'], species.tail);
    calcPoints(filterData['sMental'], species.mental);

    bool hemipenes = filterData['sHemipenes'] ?? false;
    if(filterData['sVents'] != null) {
      calcPoints([hemipenes, filterData['sVents']], species.vents);
    }
    if(filterData['sSubcaudals'] != null) {
      calcPoints([hemipenes, filterData['sSubcaudals']], species.subcaudals);
    }
  }


  void calcPoints(filter, speciesData) {
    if(filter == null || (filter is List && (filter.length <= 0))) {
      return;
    }

    if(speciesData.isUncertain(filter)) {
      this.uncertains.add(speciesData.uncertainText);
      //debugPrint(this.uncertains.toString());
    } else {
      if (speciesData.isHit(filter)) {
        this.points += 10;
        this.hits.add(speciesData.getTableObject(filter, species));
      } else {
        //this.points -= 10;
        this.misses.add(speciesData.getTableObject(filter, species));
      }
    }

    this.maxPoints += 10;
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

  Column getUncertains() {
    List<Widget> columns = [];
    for(var i = 0; i < this.uncertains.length; i++) {
      columns.add(
          new Container(
              child: new Row(
                  children: [
                    new Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.warning,
                          color: Colors.indigoAccent,
                          size: 24.0
                        )
                    ),
                    Flexible(child: new Text(this.uncertains[i]))
                  ]
              )
          )
      );
    }
    //debugPrint(columns.toString());
    return Column(
      children: columns
    );
  }

  bool isAnyUncertain() {
    this.maxPoints = 0;
    this.points = 0;
    this.calculatePoints();
    return (this.uncertains.length > 0);
  }

  Container getUncertainIcon() {
    if(!this.isAnyUncertain()) {
      return new Container();
    }

    return new Container(
        padding: EdgeInsets.only(right: 5),
        child: new Icon(
            Icons.warning,
            color: Colors.indigoAccent,
            size: 24.0
        )
    );
  }

  Table getTableHits() {
    return this.getTable(this.hits);
  }

  Table getTableMisses() {
    return this.getTable(this.misses);
  }

  Table getTable(data) {
    List<TableRow> rows = [
      new TableRow(
          children: [
            new Container(
                color: Colors.black54,
                padding: EdgeInsets.all(7),
                child: new Text('Type', style: TextStyle(color: Colors.white))
            ),
            new Container(
                color: Colors.black54,
                padding: EdgeInsets.all(7),
                child: new Text('Species', style: TextStyle(color: Colors.white))
            ),
            new Container(
                color: Colors.black54,
                padding: EdgeInsets.all(7),
                child: new Text('Picked', style: TextStyle(color: Colors.white))
            )
          ]
      )
    ];

    for(var i = 0; i < data.length; i++) {
      rows.add(
          new TableRow(
              children: [
                new Container(
                    padding: EdgeInsets.all(7),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(data[i]['Label'], style: TextStyle()),
                        ]
                    )
                ),
                new Container(
                    padding: EdgeInsets.all(7),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(data[i]['SpeciesValue'], style: TextStyle(fontWeight: FontWeight.bold)),
                        ]
                    )
                ),
                new Container(
                    padding: EdgeInsets.all(7),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(data[i]['PickedValue'], style: TextStyle(fontWeight: FontWeight.bold))
                        ]
                    )
                ),
              ]
          )
      );
    }




    return new Table(
      border: TableBorder.all(color: Colors.black54),
      columnWidths: {
        0: FlexColumnWidth(6),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
      },
      children: rows,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Row(children: [
      this.getUncertainIcon(),
      new Container(
        width: 60,
        color:  getColor(),
        padding: const EdgeInsets.all(3.0),
        child: new Text(getPercentage().toString()+'%', textAlign: TextAlign.center)
      )
    ]
    );
  }
}


