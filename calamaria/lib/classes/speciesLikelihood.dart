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
  List<Map<String, dynamic>> missesUncertain = [];
  List<String> uncertains = [];
  List<String> uncertainsLow = [];
  List<String> uncertainsHigh = [];
  List<String> warnings = [];

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

  int getSort() {
    int isAnyUncertain = (this.isAnyUncertain()) ? 1 : 0;
    return (this.getPercentage()*1000)+isAnyUncertain;
  }

  void calculatePoints() {
    calcPoints(filterData['sUpperLabials'], species.upperLabials, species.uncertains);
    calcPoints(filterData['sLowerLabials'], species.lowerLabials, species.uncertains);
    calcPoints(filterData['sULTouchingEye'], species.upperLabialsTouchingEye, species.uncertains);
    calcPoints(filterData['sPreocular'], species.preocular, species.uncertains);
    calcPoints(filterData['sPostocular'], species.postocular, species.uncertains);
    calcPoints(filterData['sSSEP'], species.ssep, species.uncertains);
    calcPoints(filterData['sEyeDiam'], species.eyeDiameter, species.uncertains);
    calcPoints(filterData['sTail'], species.tail, species.uncertains);
    calcPoints(filterData['sMental'], species.mental, species.uncertains);

    bool hemipenes = filterData['sHemipenes'] ?? false;
    if(filterData['sVents'] != null) {
      calcPoints([hemipenes, filterData['sVents']], species.vents, species.uncertains);
    }
    if(filterData['sSubcaudals'] != null) {
      calcPoints([hemipenes, filterData['sSubcaudals']], species.subcaudals, species.uncertains);
    }

  }

  void processWarnings(filter, speciesData, warnings) {
    String uncertainKey = speciesData.GetUncertainKey(filter);
    SpeciesWarning warning = getWarning(uncertainKey, warnings);
    if(warning != null && !this.warnings.contains(warning.Text)) {
      this.warnings.add(warning.Text);
    }
  }

  void calcPoints(filter, speciesData, uncertains) {
    if(filter == null || (filter is List && (filter.length <= 0))) {
      return;
    }
    this.processWarnings(filter, speciesData, species.warnings);

    String uncertainKey = speciesData.GetUncertainKey(filter);
    SpeciesUncertain uncertain = getUncertain(uncertainKey, uncertains);

    var pointTableItem = speciesData.getTableObject(filter, species);

      if (speciesData.isHit(filter)) {
        this.points += 10;
        pointTableItem['Points'] = 10;
        this.hits.add(pointTableItem);
      } else {
        //this.points -= 10;
        if(uncertain != null) {
          if(uncertain.Level == 1) {
            this.uncertainsLow.add(uncertain.Text);
          }
          if(uncertain.Level == 2) {
            this.uncertains.add(uncertain.Text);
          }
          if(uncertain.Level == 3) {
            this.uncertainsHigh.add(uncertain.Text);
          }
          this.points += uncertain.Points;
          pointTableItem['Points'] = uncertain.Points;
          pointTableItem['Level'] = uncertain.Level;
          this.missesUncertain.add(pointTableItem);
        } else {
          pointTableItem['Points'] = 0;
          this.misses.add(pointTableItem);
        }
      }


    this.maxPoints += 10;
  }

  SpeciesUncertain getUncertain(key, uncertains) {
    return uncertains.firstWhere((element) => element.Type == key, orElse: () => null);
  }
  SpeciesWarning getWarning(key, warnings) {
    return warnings.firstWhere((element) => (element.Type.contains(key) == true), orElse: () => null);
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

  List<Widget> getUncertainNotices(arrayUncertains, color) {
    List<Widget> columns = [];
    for(var i = 0; i < arrayUncertains.length; i++) {
      columns.add(
          new Container(
              child: new Row(
                  children: [
                    new Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                            Icons.warning,
                            color: color,
                            size: 24.0
                        )
                    ),
                    Flexible(child: new Text(arrayUncertains[i]))
                  ]
              )
          )
      );
    }
    return columns;
  }

  Column getUncertains() {
    List<Widget> columns = [];

    columns = [
      ...getUncertainNotices(this.uncertainsHigh, Colors.red),
      ...getUncertainNotices(this.uncertains, Colors.amberAccent),
      ...getUncertainNotices(this.uncertainsLow, Colors.indigoAccent)
    ];

    return Column(
      children: columns
    );
  }

  Column getWarnings() {
    List<Widget> columns = [];
    for(var i = 0; i < this.warnings.length; i++) {
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
                    Flexible(child: new Text(this.warnings[i]))
                  ]
              )
          )
      );
    }

    return Column(
        children: columns
    );
  }

  bool isAnyUncertain() {
    this.maxPoints = 0;
    this.points = 0;
    this.calculatePoints();
    return (this.uncertains.length > 0) || (this.uncertainsLow.length > 0) || (this.uncertainsHigh.length > 0);
  }

  bool isAnyWarnings() {
    return (this.warnings.length > 0);
  }

  Container getUncertainIcon(level, [iconSize = 24.0]) {
    Color color = Colors.purple;
    switch(level) {
      case 1:
        color = Colors.indigoAccent;
        break;
      case 2:
        color = Colors.amberAccent;
        break;
      case 3:
        color = Colors.red;
        break;
      case 0:
        return new Container();
        break;
    }

    return new Container(
        padding: EdgeInsets.only(right: 5),
        child: new Icon(
            Icons.warning,
            color: color,
            size: iconSize,
        ),
        width: iconSize

    );
  }

  int getHighestUncertainLevel() {
    if(this.uncertainsHigh.length > 0) return 3;
    if(this.uncertains.length > 0) return 2;
    if(this.uncertainsLow.length > 0) return 1;
    return 0;
  }

  Table getTableHits() {
    return this.getTable(this.hits);
  }

  Table getTableMisses() {
    return this.getTable([...this.misses, ...this.missesUncertain]);
  }
/*
  Table getTableUncertain() {
    return this.getTable(this.missesUncertain);
  }
 */

  Table getTable(data) {
    if(data.length <= 0) {
      return new Table(children: [
        new TableRow(children: [
          new Container(
            child: new Text('-')
          )
        ])
      ]);
    }
    List<TableRow> rows = [
      new TableRow(
          children: [
            new Container(
                color: Colors.black54,
                padding: EdgeInsets.all(7),
                child: new Text('Type', style: TextStyle(color: Colors.white, fontSize: 11))
            ),
            new Container(
                color: Colors.black54,
                padding: EdgeInsets.all(7),
                child: new Text('Species', style: TextStyle(color: Colors.white, fontSize: 11))
            ),
            new Container(
                color: Colors.black54,
                padding: EdgeInsets.all(7),
                child: new Text('Picked', style: TextStyle(color: Colors.white, fontSize: 11))
            ),
            new Container(
                color: Colors.black54,
                padding: EdgeInsets.all(7),
                child: new Text('Points', style: TextStyle(color: Colors.white, fontSize: 11))
            )
          ]
      )
    ];

    for(var i = 0; i < data.length; i++) {
      var icon;
      if(data[i]['Level'] != null && data[i]['Level'] > 0) {
        icon = getUncertainIcon(data[i]['Level'], 16.0);
        icon = Align(
            alignment: Alignment.bottomRight,
            child: icon
        );
      }
      rows.add(
          new TableRow(
              children: [
                new Container(
                    padding: EdgeInsets.all(7),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Stack(
                            children: [
                              new Text(data[i]['Label'], style: TextStyle(fontSize: 12)),
                              ((icon != null) ? icon : new Container())
                            ]
                            )
                        ]
                    )
                ),
                new Container(
                    padding: EdgeInsets.all(7),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(data[i]['SpeciesValue'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        ]
                    )
                ),
                new Container(
                    padding: EdgeInsets.all(7),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(data[i]['PickedValue'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                        ]
                    )
                ),
                new Container(
                    padding: EdgeInsets.all(7),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(((data[i]['Points'] != null && data[i]['Points'] > 0) ? '+'+data[i]['Points'].toString() : '0'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                        ]
                    )
                )
              ]
          )
      );
    }




    return new Table(
      border: TableBorder.all(color: Colors.black54),
      columnWidths: {
        0: FlexColumnWidth(9),
        1: FlexColumnWidth(6),
        2: FlexColumnWidth(3.5),
        3: FlexColumnWidth(3.5),
      },
      children: rows,
    );
  }


  @override
  Widget build(BuildContext context) {
    String percentage = getPercentage().toString();
    return new Row(children: [
      //this.getUncertainIcon(this.getHighestUncertainLevel()),
      new Container(
        width: 60,
        color:  getColor(),
        padding: const EdgeInsets.all(3.0),
        child: new Text(percentage+'%', textAlign: TextAlign.center)
      ),

    ]
    );
  }
}


