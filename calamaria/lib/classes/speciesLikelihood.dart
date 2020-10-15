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

  SpeciesLikelihood(this.species, this.filter) {
    filterData = this.filter.toJson();
  }


  int getPercentage() {
    int percentage = 0;
    this.maxPoints = 0;
    this.points = 0;

    calcPoints(filterData['sUpperLabials'], species.upperLabials);
    calcPoints(filterData['sLowerLabials'], species.lowerLabials);
    calcPoints(filterData['sULTouchingEye'], species.upperLabialsTouchingEye);
    calcPoints(filterData['sPreocular'], species.preocular);
    debugPrint('postocular: '+species.postocular.toString());
    calcPoints(filterData['sPostocular'], species.postocular);
    //calcPoints(filterData['sPostFused'], species.postocularfused);
    calcPoints(filterData['sSSEP'], species.ssep);
    calcPoints(filterData['sEyeDiam'], species.eyeDiameter);

    calcPoints([filterData['sHemipenes'], filterData['sVents']], species.vents);
    calcPoints([filterData['sHemipenes'], filterData['sSubcaudals']], species.subcaudals);


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
