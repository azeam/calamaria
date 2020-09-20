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
    calcPoints([filterData['sPostocular'], filterData['sPostFused']], species.postocular);
    calcPoints(filterData['sSSEP'], species.ssep);




    calcPoints([filterData['sHemipenes'], filterData['sVents']], species.vents);
    calcPoints([filterData['sHemipenes'], filterData['sSubcaudals']], species.subcaudals);




    calcPoints(filterData['sEyeDiam'], species.eyeDiameter);


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



    if(speciesData is List) {
      if(speciesData.contains(filter)) {
        this.points += 10;
      }
    }
    if(speciesData is SpeciesDataMental) {
      calcPoints(true, (filter) ? speciesData.isTouching : speciesData.isNotTouching, false);
    }
    if(speciesData is SpeciesDataPreocular) {
      calcPoints(true, (filter) ? speciesData.isPresent : speciesData.isAbsent, false);
    }
    if(speciesData is SpeciesDataPostocular) {
      if(filter[0] == null && filter[1] == null) {
        return;
      }
      if(filter[0] != null) {
        calcPoints(true, ((filter[0]) ? speciesData.isPresent : speciesData.isAbsent), false);
      }
      if(filter[1] != null) {
        calcPoints((filter[1]), speciesData.isFused, false);
      }
    }
    if(speciesData is SpeciesDataSSEP) {
      switch(filter) {
        case 4:
          if(speciesData.isFour) { this.points += 10; }
          break;
        case 5:
          if(speciesData.isFive) { this.points += 10; }
          break;
        case 6:
          if(speciesData.isSix) { this.points += 10; }
          break;
      }
    }
    if(speciesData is SpeciesDataEyeDiameter) {
      switch(filter) {
        case 'smaller':
          if(speciesData.isSmaller) { this.points += 10; }
          break;
        case 'larger':
          if(speciesData.isLarger) { this.points += 10; }
          break;
        case 'equal':
          if(speciesData.isEqual) { this.points += 10; }
          break;
      }
    }
    if(speciesData is SpeciesDataTail) {
      switch(filter) {
        case 'gradual':
          if(speciesData.isGradual) { this.points += 10; }
          break;
        case 'intermediate':
          if(speciesData.isIntermediate) { this.points += 10; }
          break;
        case 'abrupt':
          if(speciesData.isAbrupt) { this.points += 10; }
          break;
      }
    }

    if(speciesData is SpeciesDataTail) {
      switch(filter) {
        case 'gradual':
          if(speciesData.isGradual) { this.points += 10; }
          break;
        case 'intermediate':
          if(speciesData.isIntermediate) { this.points += 10; }
          break;
        case 'abrupt':
          if(speciesData.isAbrupt) { this.points += 10; }
          break;
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

    debugPrint(filter.toString());
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
