import '../classes/speciesLikelihood.dart';
import 'package:flutter/foundation.dart';

class Species {
  final int specieId;
  final String scientificName;

  final SpeciesDataUpperLabials upperLabials;
  final SpeciesDataLowerLabials lowerLabials;
  final SpeciesDataUpperLabialsTouchingEye upperLabialsTouchingEye;
  final SpeciesDataMental mental;
  final SpeciesDataPreocular preocular;
  final SpeciesDataSupraocular supraocular;
  final SpeciesDataPostocular postocular;
  final SpeciesDataPostocularFused postocularfused;
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
      this.postocularfused,
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
        upperLabials: new SpeciesDataUpperLabials(
            list: json['UpperLabials'] as List
        ),
        lowerLabials: new SpeciesDataLowerLabials(
            list: json['LowerLabials'] as List
        ),
        upperLabialsTouchingEye: new SpeciesDataUpperLabialsTouchingEye(
            list: json['ULTouchingEye'] as List
        ),
        mental: new SpeciesDataMental(
            isTouching: json['Mental']['Touching'] as bool,
            isNotTouching: json['Mental']['NotTouching']),
        preocular: new SpeciesDataPreocular(
            isPresent: json['Preocular']['Present'] as bool,
            isAbsent: json['Preocular']['Absent'] as bool),
        supraocular: new SpeciesDataSupraocular(
            isPresent: json['Supraocular']['Present'] as bool,
            isAbsent: json['Supraocular']['Absent'] as bool),
        postocular: new SpeciesDataPostocular(
            isPresent: json['Postocular']['Present'] as bool,
            isAbsent: json['Postocular']['Absent'] as bool),
        postocularfused: new SpeciesDataPostocularFused(
            isFused: json['PostocularFused']['Fused'] as bool),
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
              ? json['Subcaudals']['Male']['Min'] as int
              : null),
          maleMax: ((json['Subcaudals']['Male'] != null)
              ? json['Subcaudals']['Male']['Max'] as int
              : null),
          femaleMin: ((json['Subcaudals']['Female'] != null)
              ? json['Subcaudals']['Female']['Min'] as int
              : null),
          femaleMax: ((json['Subcaudals']['Female'] != null)
              ? json['Subcaudals']['Female']['Max'] as int
              : null),
          bothMin: ((json['Subcaudals']['Both'] != null)
              ? json['Subcaudals']['Both']['Min'] as int
              : null),
          bothMax: ((json['Subcaudals']['Both'] != null)
              ? json['Subcaudals']['Both']['Max'] as int
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


class SpeciesDataUpperLabials {
  final List list;
  SpeciesDataUpperLabials({this.list});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = list.join(' & ');
    if(filter is List) {
      pickedText = filter.join(' & ');
    }

    return {
      'Label': 'Upper labials',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    if(this.list.contains(value)) {
      return true;
    }
    return false;
  }

  bool isUncertain(value) {
    return false;
  }
}

class SpeciesDataLowerLabials {
  final List list;
  SpeciesDataLowerLabials({this.list});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = list.join(' & ');
    if(filter is List) {
      pickedText = filter.join(' & ');
    }

    return {
      'Label': 'Lower labials',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    if(this.list.contains(value)) {
      return true;
    }
    return false;
  }

  bool isUncertain(value) {
    return false;
  }
}

class SpeciesDataUpperLabialsTouchingEye {
  final List list;
  SpeciesDataUpperLabialsTouchingEye({this.list});

  Map<String, dynamic> getTableObject(filter, species) {
    String pickedText = filter.join(' & ');
    debugPrint(filter.toString()+' - ');
    String speciesText = list.join(' & ');
    if(filter is List) {
      pickedText = filter.join(' & ');
    }

    return {
      'Label': 'Upper labials touching eye',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    if(listEquals(this.list, value)) {
      return true;
    }
    return false;
  }

  bool isUncertain(value) {
    return false;
  }
}

class SpeciesDataMental {
  final bool isTouching;
  final bool isNotTouching;
  SpeciesDataMental({this.isTouching, this.isNotTouching});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = species.mental.isTouching.toString();
    
    return {
      'Label': 'Mental touching chin shields',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    return (value) ? this.isTouching : this.isNotTouching;
  }

  bool isUncertain(value) {
    return false;
  }
}

class SpeciesDataPreocular {
  bool isPresent;
  bool isAbsent;
  SpeciesDataPreocular({this.isPresent, this.isAbsent});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = species.preocular.isPresent.toString();

    return {
      'Label': 'Preocular present',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    return (value) ? this.isPresent : this.isAbsent;
  }

  bool isUncertain(value) {
    return false;
  }
}

class SpeciesDataSupraocular {
  bool isPresent;
  bool isAbsent;
  SpeciesDataSupraocular({this.isPresent, this.isAbsent});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = species.supraocular.isPresent.toString();

    return {
      'Label': 'Supraocular present',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    return (value) ? this.isPresent : this.isAbsent;
  }

  bool isUncertain(value) {
    return false;
  }
}

class SpeciesDataPostocular {
  bool isPresent;
  bool isAbsent;
  SpeciesDataPostocular({this.isPresent, this.isAbsent});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = species.postocular.isPresent.toString();

    return {
      'Label': 'Postocular present',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    return (value) ? this.isPresent : this.isAbsent;
  }

  bool isUncertain(value) {
    return false;
  }
}
class SpeciesDataPostocularFused {
  bool isFused;
  SpeciesDataPostocularFused({this.isFused});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = species.postocularfused.isFused.toString();

    return {
    'Label': 'Postocular fused',
    'PickedValue' : pickedText,
    'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    return (value == this.isFused);
  }

  bool isUncertain(value) {
    return false;
  }
}

class SpeciesDataSSEP {
  bool isFour;
  bool isFive;
  bool isSix;
  SpeciesDataSSEP({this.isFour, this.isFive, this.isSix});

  String uncertainText = 'Number of scales around paraparietal uncertain for this species.';

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    List<String> speciesTextArray = [];
    if(this.isFour != null && this.isFour) { speciesTextArray.add('4'); }
    if(this.isFive != null && this.isFive) { speciesTextArray.add('5'); }
    if(this.isSix != null && this.isSix) { speciesTextArray.add('6'); }
    String speciesText = speciesTextArray.join(' & ');

    return {
      'Label': 'Scales around paraparietal',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(filter) {
    switch(filter) {
      case 4:
        if(this.isFour != null && this.isFour) { return true; }
        break;
      case 5:
        if(this.isFive != null && this.isFive) { return true; }
        break;
      case 6:
        if(this.isSix != null && this.isSix) { return true; }
        break;
    }
    return false;
  }

  bool isUncertain(value) {
    switch(value) {
      case 4:
        if(this.isFour == null) { return true; }
        break;
      case 5:
        if(this.isFive == null) { return true; }
        break;
      case 6:
        if(this.isSix == null) { return true; }
        break;
    }
    return false;
  }
}

class SpeciesDataEyeDiameter {
  bool isSmaller;
  bool isEqual;
  bool isLarger;
  SpeciesDataEyeDiameter({this.isSmaller, this.isEqual, this.isLarger});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    List<String> speciesTextArray = [];
    if(this.isSmaller) { speciesTextArray.add('smaller'); }
    if(this.isEqual) { speciesTextArray.add('equal'); }
    if(this.isLarger) { speciesTextArray.add('larger'); }
    String speciesText = speciesTextArray.join(' or ');

    return {
      'Label': 'Eye diameter',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(filter) {
    switch(filter) {
      case 'smaller':
        if(this.isSmaller) { return true; }
        break;
      case 'larger':
        if(this.isLarger) { return true; }
        break;
      case 'equal':
        if(this.isEqual) { return true; }
        break;
    }
    return false;
  }

  bool isUncertain(value) {
    return false;
  }
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


  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter[1].toString();
    bool hemipenes = filter[0];
    String speciesText = '';

    if(hemipenes) {
      speciesText = 'Males: '+this.maleMin.toString()+'-'+this.maleMax.toString();
    } else {
      speciesText = ''+this.bothMin.toString()+'-'+this.bothMax.toString();
    }

    return {
      'Label': 'Ventrals',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(filter) {
    bool hemipenes = filter[0];
    if(hemipenes) {
      if(filter[1] >= this.maleMin && filter[1] <= this.maleMax) {
        return true;
      }
    } else {
      if(filter[1] >= this.bothMin && filter[1] <= this.bothMax) {
        return true;
      }
    }
    return false;
  }

  bool isUncertain(value) {
    return false;
  }
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

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter[1].toString();
    bool hemipenes = filter[0];
    String speciesText = '';

    if(hemipenes) {
      speciesText = 'Males: '+this.maleMin.toString()+'-'+this.maleMax.toString();
    } else {
      speciesText = ''+this.bothMin.toString()+'-'+this.bothMax.toString();
    }

    return {
      'Label': 'Subcaudals',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(filter) {
    bool hemipenes = filter[0];
    if(hemipenes) {
      if(filter[1] >= this.maleMin && filter[1] <= this.maleMax) {
        return true;
      }
    } else {
      if(filter[1] >= this.bothMin && filter[1] <= this.bothMax) {
        return true;
      }
    }
    return false;
  }

  bool isUncertain(value) {
    return false;
  }
}

class SpeciesDataTail {
  bool isGradual;
  bool isIntermediate;
  bool isAbrupt;
  SpeciesDataTail({this.isGradual, this.isIntermediate, this.isAbrupt});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    List<String> speciesTextArray = [];
    if(this.isGradual) { speciesTextArray.add('gradual'); }
    if(this.isIntermediate) { speciesTextArray.add('intermediate'); }
    if(this.isAbrupt) { speciesTextArray.add('abrupt'); }
    String speciesText = speciesTextArray.join(' or ');

    return {
      'Label': 'Tail tapering',
      'PickedValue' : pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(filter) {
    switch(filter) {
      case 'gradual':
        if(this.isGradual) { return true; }
        break;
      case 'intermediate':
        if(this.isIntermediate) { return true; }
        break;
      case 'abrupt':
        if(this.isAbrupt) { return true; }
        break;
    }
    return false;
  }

  bool isUncertain(value) {
    return false;
  }
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
