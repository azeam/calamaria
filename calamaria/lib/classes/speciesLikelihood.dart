import 'dart:convert';
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

  SpeciesLikelihood(this.species, this.filter) {
    filterData = this.filter.toJson();
  }


  int getPercentage() {
    int percentage = 0;
    this.maxPoints = 0;
    this.points = 0;

    calcPoints(filterData['sUpperLabials'], species.upperLabials);
    calcPoints(filterData['sLowerLabials'], species.lowerLabials);
    calcPoints(filterData['sPreocular'], species.preocular);
    //calcPoints([filterData['sPostocular'], filterData['sPostFused']], species.postocular);
    //calcPoints(filterData['sSSEP'], species.ssep);


    //calcPointsListMatch(filterData['sULTouchingEye'], species.upperLabialsTouchingEye);

    if(this.points <= 0 || this.maxPoints == 0) {
      return 0;
    } else {
      percentage = (this.points/this.maxPoints*100).toInt();
    }

    return percentage;
  }

  void calcPoints(filter, speciesData, [addToMaxPoints = true]) {
    if(filter == null) {
      return;
    }

    if(addToMaxPoints) {
      this.maxPoints += 1;
    }

    if(speciesData is List) {
      if(speciesData.contains(filter)) {
        this.points += 1;
      } else {
        this.points -= 1;
      }
    }
    if(speciesData is SpeciesDataMental) {
      calcPoints(true, (filter) ? speciesData.isTouching : speciesData.isNotTouching, false);
    }
    if(speciesData is SpeciesDataPreocular) {
      calcPoints(true, (filter) ? speciesData.isPresent : speciesData.isAbsent, false);
    }
    if(speciesData is SpeciesDataPostocular) {
      calcPoints(true, (filter[0]) ? speciesData.isPresent : speciesData.isAbsent, false);
      calcPoints(filter[1],  speciesData.isFused, false);
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
