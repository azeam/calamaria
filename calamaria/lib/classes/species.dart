import '../classes/speciesLikelihood.dart';
import 'package:flutter/foundation.dart';

class Species {
  final int specieId;
  final String scientificName;
  final List upperLabials;
  final List lowerLabials;
  final List upperLabialsTouchingEye;

  final SpeciesDataMental mental;
  final SpeciesDataPreocular preocular;
  final SpeciesDataSupraocular supraocular;
  final SpeciesDataPostocular postocular;
  final SpeciesDataSSEP ssep;
  final SpeciesDataEyeDiameter eyeDiameter;
  final SpeciesDataVents vents;
  final SpeciesDataSubcaudals subcaudals;
  final SpeciesDataTail tail;

  final String notes;
  final String image;
  final String description;

  Species(
      {this.specieId,
      this.scientificName,
      this.upperLabials,
      this.lowerLabials,
      this.upperLabialsTouchingEye,
      this.mental,
      this.preocular,
      this.supraocular,
      this.postocular,
      this.ssep,
      this.eyeDiameter,
      this.vents,
      this.subcaudals,
      this.tail,
      this.notes,
      this.image,
      this.description});

  /*
  "Mental":  {"Touching":  true, "NotTouching":  false},
    "Preocular": {"Present":  true, "Absent":  false},
    "Supraocular": {"Present":  true, "Absent":  false},
    "Postocular": {"Present":  true, "Absent":  false, "Fused":  false},
    "SSEP": {"4":  false, "5":  false, "6":  true},
    "EyeDiam": {"Smaller":  false, "Equal":  false, "Larger": true},
    "Vents": {
      "Male": {"Min":  171, "Max":  171},
      "Female": null
    },
    "Subcaudals": {
      "Male": {"Min":  16, "Max":  16},
      "Female": null
    },
    "Tail": {"Gradually":  false, "SomewhatAbruptly":  false, "Abruptly":  true},
    "Notes": "ERROR in SoB2:  the sole known specimen is a MALE (I&M 1965:208)!",
   */

  /*
  "sMental": sMental == 0 ? true : sMental == 1 ? false : null,
      "sPreocular": sPreocular == 0 ? true : sPreocular == 1 ? false : null,
      "sPostocular": sPostocular == 0 ? true : sPostocular == 1 ? false : null,
      "sPostFused": sPostFused == 0 ? true : sPostFused == 1 ? false : null,
      "sSSEP": sSSEP,
      "sEyeDiam": sEyeDiam == 0
          ? "smaller"
          : sEyeDiam == 1 ? "equal" : sEyeDiam == 2 ? "larger" : null,
      "sHemipenes": sHemipenes == 0 ? true : sHemipenes == 1 ? false : null,
      "sVents": sVents,
      "sSubcaudals": sSubcaudals,
      "sTail": sTail == 0
          ? "gradual"
          : sTail == 1 ? "intermediate" : sTail == 2 ? "abrupt" : null,

   */

  factory Species.fromJSON(Map<String, dynamic> json,
      [Map<String, dynamic> likelihoodJson]) {
    var species = new Species(
        specieId: json['id'] as int,
        scientificName: json['ScientificName'] as String,
        upperLabials: json['UpperLabials'] as List,
        lowerLabials: json['LowerLabials'] as List,
        upperLabialsTouchingEye: json['ULTouchingEye'] as List,
        mental: new SpeciesDataMental(
            isTouching: json['Mental']['Touching'] as bool,
            isNotTouching: json['Mental']['NotTouching']),
        preocular: new SpeciesDataPreocular(
            isPresent: json['Preocular']['Present'] as bool,
            isAbsent: json['Preocular']['IsAbsent'] as bool),
        supraocular: new SpeciesDataSupraocular(
            isPresent: json['Preocular']['Present'] as bool,
            isAbsent: json['Preocular']['IsAbsent'] as bool),
        postocular: new SpeciesDataPostocular(
            isPresent: json['Preocular']['Present'] as bool,
            isAbsent: json['Preocular']['IsAbsent'] as bool,
            isFused: json['Preocular']['Fused'] as bool),
        ssep: new SpeciesDataSSEP(
            isFour: json['SSEP']['4'] as bool,
            isFive: json['SSEP']['5'] as bool,
            isSix: json['SSEP']['6'] as bool),
        eyeDiameter: new SpeciesDataEyeDiameter(
            isEqual: json['EyeDiam']['Equal'] as bool,
            isSmaller: json['EyeDiam']['Smaller'] as bool,
            isLarger: json['EyeDiam']['Larger'] as bool),
        vents: new SpeciesDataVents(
          maleMin: ((json['Vents']['Male'] != null)
              ? json['Vents']['Male']['Min'] as int
              : null),
          maleMax: ((json['Vents']['Male'] != null)
              ? json['Vents']['Male']['Max'] as int
              : null),
          femaleMin: ((json['Vents']['Female'] != null)
              ? json['Vents']['Female']['Min'] as int
              : null),
          femaleMax: ((json['Vents']['Female'] != null)
              ? json['Vents']['Female']['Max'] as int
              : null),
          bothMin: ((json['Vents']['Both'] != null)
              ? json['Vents']['Both']['Min'] as int
              : null),
          bothMax: ((json['Vents']['Both'] != null)
              ? json['Vents']['Both']['Max'] as int
              : null),
        ),
        subcaudals: new SpeciesDataSubcaudals(
          maleMin: ((json['Subcaudals']['Male'] != null)
              ? json['Vents']['Male']['Min'] as int
              : null),
          maleMax: ((json['Subcaudals']['Male'] != null)
              ? json['Vents']['Male']['Max'] as int
              : null),
          femaleMin: ((json['Subcaudals']['Female'] != null)
              ? json['Vents']['Female']['Min'] as int
              : null),
          femaleMax: ((json['Subcaudals']['Female'] != null)
              ? json['Vents']['Female']['Max'] as int
              : null),
          bothMin: ((json['Subcaudals']['Both'] != null)
              ? json['Vents']['Both']['Min'] as int
              : null),
          bothMax: ((json['Subcaudals']['Both'] != null)
              ? json['Vents']['Both']['Max'] as int
              : null),
        ),
        tail: new SpeciesDataTail(
            isGradual: json['Tail']['Gradual'] as bool,
            isIntermediate: json['Tail']['Intermediate'] as bool,
            isAbrupt: json['Tail']['Abrupt'] as bool),
        notes: json['Notes'] as String,
        image: json['Image'] as String,
        description: json['Description'] as String);

    return species;
  }
}

class SpeciesDataMental {
  final bool isTouching;
  final bool isNotTouching;
  SpeciesDataMental({this.isTouching, this.isNotTouching});
}

class SpeciesDataPreocular {
  bool isPresent;
  bool isAbsent;
  SpeciesDataPreocular({this.isPresent, this.isAbsent});
}

class SpeciesDataSupraocular {
  bool isPresent;
  bool isAbsent;
  SpeciesDataSupraocular({this.isPresent, this.isAbsent});
}

class SpeciesDataPostocular {
  bool isPresent;
  bool isAbsent;
  bool isFused;
  SpeciesDataPostocular({this.isPresent, this.isAbsent, this.isFused});
}

class SpeciesDataSSEP {
  bool isFour;
  bool isFive;
  bool isSix;
  SpeciesDataSSEP({this.isFour, this.isFive, this.isSix});
}

class SpeciesDataEyeDiameter {
  bool isSmaller;
  bool isEqual;
  bool isLarger;
  SpeciesDataEyeDiameter({this.isSmaller, this.isEqual, this.isLarger});
}

class SpeciesDataVents {
  int maleMin;
  int maleMax;
  int femaleMin;
  int femaleMax;
  int bothMin;
  int bothMax;
  SpeciesDataVents(
      {this.maleMin,
      this.maleMax,
      this.femaleMin,
      this.femaleMax,
      this.bothMin,
      this.bothMax});
}

class SpeciesDataSubcaudals {
  int maleMin;
  int maleMax;
  int femaleMin;
  int femaleMax;
  int bothMin;
  int bothMax;
  SpeciesDataSubcaudals(
      {this.maleMin,
      this.maleMax,
      this.femaleMin,
      this.femaleMax,
      this.bothMin,
      this.bothMax});
}

class SpeciesDataTail {
  bool isGradual;
  bool isIntermediate;
  bool isAbrupt;
  SpeciesDataTail({this.isGradual, this.isIntermediate, this.isAbrupt});
}

/*
Future<String>_loadFromAsset() async {
  return await rootBundle.loadString("assets/species.json");
}

Future parseJson() async {
  string jsonString = await _loadFromAsset();
  final jsonResponse = jsonDecode(jsonString);
}

 */
