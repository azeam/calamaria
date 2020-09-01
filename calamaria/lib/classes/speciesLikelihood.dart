import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class SpeciesLikelihood extends StatelessWidget {
  double percentage;
  int upperlabials;
  SpeciesLikelihood(this.percentage);


  void setUpperLabials(upperlabials) {
    this.upperlabials = upperlabials;
  }



  int getPercentage() {
    var percentage = 0;
    if(upperlabials == 5) {
      percentage = 100;
    }

    return percentage;
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


    /*
    if(percentage < 40) {
      return  Color.lerp(Colors.red, Colors.yellow, (percentage/40));
    } else {
      return  Color.lerp(Colors.yellow, Colors.green, ((percentage-40)/60));
    }
     */
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
