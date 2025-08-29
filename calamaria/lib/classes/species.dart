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
  final SpeciesDataSSEP ssep;
  final SpeciesDataEyeDiameter eyeDiameter;
  final SpeciesDataVents vents;
  final SpeciesDataSubcaudals subcaudals;
  final SpeciesDataTail tail;

  final String description;
  final List uncertains;
  final List warnings;
  final String author;
  

  Species(
      {
        this.specieId = 0,
        this.scientificName = 'Not found',
        this.upperLabials = const SpeciesDataUpperLabials(),
        this.lowerLabials = const SpeciesDataLowerLabials(list: []),
        this.upperLabialsTouchingEye = const SpeciesDataUpperLabialsTouchingEye(list: []),
        this.mental = const SpeciesDataMental(isTouching: false, isNotTouching: false),
        this.preocular = const SpeciesDataPreocular(isPresent: false, isAbsent: false),
        this.supraocular = const SpeciesDataSupraocular(isPresent: false, isAbsent: false),
        this.postocular = const SpeciesDataPostocular(isPresent: false, isAbsent: false),
        this.ssep = const SpeciesDataSSEP(isFour: false, isFive: false, isSix: false),
        this.eyeDiameter = const SpeciesDataEyeDiameter(isSmaller: false, isEqual: false, isLarger: false),
        this.vents = const SpeciesDataVents(maleMin: -1, maleMax: -1, femaleMin: -1, femaleMax: -1, bothMin: -1, bothMax: -1),
        this.subcaudals = const SpeciesDataSubcaudals(maleMin: -1, maleMax: -1, femaleMin: -1, femaleMax: -1, bothMin: -1, bothMax: -1),
        this.tail = const SpeciesDataTail(isGradual: false, isIntermediate: false, isAbrupt: false),
        this.uncertains = const [],
        this.warnings = const [],
        this.description = '',
        this.author = ''
      });


  factory Species.fromJSON(Map<String, dynamic> json,
      [Map<String, dynamic>? likelihoodJson]) {
    var species = new Species(
      specieId: json['id'] as int,
      scientificName: json['ScientificName'] as String,
      upperLabials:
          new SpeciesDataUpperLabials(list: json['UpperLabials'] as List),
      lowerLabials:
          new SpeciesDataLowerLabials(list: json['LowerLabials'] as List),
      upperLabialsTouchingEye: new SpeciesDataUpperLabialsTouchingEye(
          list: json['ULTouchingEye'] as List),
      mental: new SpeciesDataMental(
          isTouching: json['Mental']['Touching'] as bool,
          isNotTouching: json['Mental']['NotTouching'] as bool
      ),
      preocular: new SpeciesDataPreocular(
          isPresent: json['Preocular']['Present'] as bool,
          isAbsent: json['Preocular']['Absent'] as bool
      ),
      supraocular: new SpeciesDataSupraocular(
          isPresent: json['Supraocular']['Present'] as bool,
          isAbsent: json['Supraocular']['Absent'] as bool
      ),
      postocular: new SpeciesDataPostocular(
          isPresent: json['Postocular']['Present'] as bool,
          isAbsent: json['Postocular']['Absent'] as bool
      ),
      ssep: new SpeciesDataSSEP(
          isFour: json['SSEP']['4'] as bool,
          isFive: json['SSEP']['5'] as bool,
          isSix: json['SSEP']['6'] as bool
      ),
      eyeDiameter: new SpeciesDataEyeDiameter(
          isEqual: json['EyeDiam']['Equal'] as bool,
          isSmaller: json['EyeDiam']['Smaller'] as bool,
          isLarger: json['EyeDiam']['Larger'] as bool
      ),
      vents: new SpeciesDataVents(
        maleMin: json['Vents']['Male']['Min'] as int,
        maleMax: json['Vents']['Male']['Max'] as int,
        femaleMin: json['Vents']['Female']['Min'] as int,
        femaleMax: json['Vents']['Female']['Max'] as int,
        bothMin: json['Vents']['Both']['Min'] as int,
        bothMax: json['Vents']['Both']['Max'] as int,
      ),
      subcaudals: new SpeciesDataSubcaudals(
        maleMin: json['Subcaudals']['Male']['Min'] as int,
        maleMax: json['Subcaudals']['Male']['Max'] as int,
        femaleMin: json['Subcaudals']['Female']['Min'] as int,
        femaleMax: json['Subcaudals']['Female']['Max'] as int,
        bothMin: json['Subcaudals']['Both']['Min'] as int,
        bothMax: json['Subcaudals']['Both']['Max'] as int,
      ),
      tail: new SpeciesDataTail(
          isGradual: json['Tail']['Gradual'] as bool,
          isIntermediate: json['Tail']['Intermediate'] as bool,
          isAbrupt: json['Tail']['Abrupt'] as bool),
      uncertains: json['Uncertains'].map((tagJson) => new SpeciesUncertain.fromJson(tagJson)).toList(),
      warnings: json['Warnings'].map((tagJson) => new SpeciesWarning.fromJson(tagJson)).toList(),
      description: json['Description'] as String,
      author: json['Author'] as String,
    );

    return species;
  }
}

class SpeciesDataUpperLabials {
  final List list;
  
  const SpeciesDataUpperLabials({this.list = const []});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = list.join(' & ');
    if (filter is List) {
      pickedText = filter.join(' & ');
    }

    return {
      'Label': 'Upper labials',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    if (this.list.contains(value)) {
      return true;
    }
    return false;
  }

  String GetUncertainKey(value) {
    return '';
  }
}

class SpeciesDataLowerLabials {
  final List list;
  const SpeciesDataLowerLabials({required this.list});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = list.join(' & ');
    if (filter is List) {
      pickedText = filter.join(' & ');
    }

    return {
      'Label': 'Lower labials',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    if (this.list.contains(value)) {
      return true;
    }
    return false;
  }

  String GetUncertainKey(value) {
    return '';
  }
}

class SpeciesDataUpperLabialsTouchingEye {
  final List list;
  const SpeciesDataUpperLabialsTouchingEye({required this.list});

  Map<String, dynamic> getTableObject(filter, species) {
    String pickedText = filter.join(' & ');
    String speciesText = list.join(' & ');
    if (filter is List) {
      pickedText = filter.join(' & ');
    }

    return {
      'Label': 'Upper labials touching eye',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    bool isHit = false;
    for (var i=0; i<this.list.length; i++) {
      if(listEquals(this.list[i], value.toList()) || listEquals(this.list[i], value.reversed.toList())) {
        isHit = true;
      }
    }

    return isHit;
  }

  String GetUncertainKey(value) {
    return '';
  }
}

class SpeciesDataMental {
  final bool isTouching;
  final bool isNotTouching;
  const SpeciesDataMental({required this.isTouching, required this.isNotTouching});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = species.mental.isTouching.toString();

    return {
      'Label': 'Mental touching chin shields',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    return (value) ? this.isTouching : this.isNotTouching;
  }

  String GetUncertainKey(value) {
    if(value) {
      return 'MentalsTouchingAnterior';
    } else {
      return 'MentalsNotTouchingAnterior';
    }
  }

}

class SpeciesDataPreocular {
  final bool isPresent;
  final bool isAbsent;
  const SpeciesDataPreocular({required this.isPresent, required this.isAbsent});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = species.preocular.isPresent.toString();

    return {
      'Label': 'Preocular present',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    return (value) ? this.isPresent : this.isAbsent;
  }

  String GetUncertainKey(value) {
    return '';
  }
}

class SpeciesDataSupraocular {
  final bool isPresent;
  final bool isAbsent;
  const SpeciesDataSupraocular({required this.isPresent, required this.isAbsent});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = species.supraocular.isPresent.toString();

    return {
      'Label': 'Supraocular present',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    return (value) ? this.isPresent : this.isAbsent;
  }

  String GetUncertainKey(value) {
    return '';
  }
}

class SpeciesDataPostocular {
  final bool isPresent;
  final bool isAbsent;
  const SpeciesDataPostocular({required this.isPresent, required this.isAbsent});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    String speciesText = species.postocular.isPresent.toString();

    return {
      'Label': 'Postocular present',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(value) {
    return (value) ? this.isPresent : this.isAbsent;
  }

  String GetUncertainKey(value) {
    if(value) {
      return 'PostocularPresent';
    } else {
      return 'PostocularAbsent';
    }
  }
}

class SpeciesDataSSEP {
  final bool isFour;
  final bool isFive;
  final bool isSix;
  const SpeciesDataSSEP({required this.isFour, required this.isFive, required this.isSix});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    List<String> speciesTextArray = [];
    if (this.isFour) {
      speciesTextArray.add('4');
    }
    if (this.isFive) {
      speciesTextArray.add('5');
    }
    if (this.isSix) {
      speciesTextArray.add('6');
    }
    String speciesText = speciesTextArray.join(' & ');

    return {
      'Label': 'Scales around paraparietal',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(filter) {
    switch (filter) {
      case 4:
        if (this.isFour) {
          return true;
        }
        break;
      case 5:
        if (this.isFive) {
          return true;
        }
        break;
      case 6:
        if (this.isSix) {
          return true;
        }
        break;
    }
    return false;
  }

  String GetUncertainKey(value) {
    switch(value) {
      case 4: return 'SSEP4';
      case 5: return 'SSEP5';
      case 6: return 'SSEP6';
      default:
        return '';
    }
  }

}

class SpeciesDataEyeDiameter {
  final bool isSmaller;
  final bool isEqual;
  final bool isLarger;
  const SpeciesDataEyeDiameter({required this.isSmaller, required this.isEqual, required this.isLarger});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    List<String> speciesTextArray = [];
    if (this.isSmaller) {
      speciesTextArray.add('smaller');
    }
    if (this.isEqual) {
      speciesTextArray.add('equal');
    }
    if (this.isLarger) {
      speciesTextArray.add('larger');
    }
    String speciesText = speciesTextArray.join(' or ');

    return {
      'Label': 'Eye diameter',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(filter) {
    switch (filter) {
      case 'smaller':
        if (this.isSmaller) {
          return true;
        }
        break;
      case 'larger':
        if (this.isLarger) {
          return true;
        }
        break;
      case 'equal':
        if (this.isEqual) {
          return true;
        }
        break;
    }
    return false;
  }

  String GetUncertainKey(value) {
    switch(value) {
      case 'smaller': return 'EyeSmaller';
      case 'larger': return 'EyeLarger';
      case 'equal': return 'EyeEqual';
      default:
        return '';
    }
  }

}

class SpeciesDataVents {
  final int maleMin;
  final int maleMax;
  final int femaleMin;
  final int femaleMax;
  final int bothMin;
  final int bothMax;
  const SpeciesDataVents(
      {
        this.maleMin = -1,
        this.maleMax = -1,
        this.femaleMin = -1,
        this.femaleMax = -1,
        this.bothMin = -1,
        this.bothMax = -1
      });

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter[1].toString();
    bool hemipenes = filter[0];
    String speciesText = '';

    if (hemipenes) {
      speciesText =
          'Males: ' + this.maleMin.toString() + '-' + this.maleMax.toString();
    } else {
      speciesText =
          '' + this.bothMin.toString() + '-' + this.bothMax.toString();
    }

    return {
      'Label': 'Ventrals',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(filter) {
    bool hemipenes = filter[0];
    if (hemipenes) {
      if (filter[1] >= this.maleMin && filter[1] <= this.maleMax) {
        return true;
      }
    } else {
      if (filter[1] >= this.bothMin && filter[1] <= this.bothMax) {
        return true;
      }
    }
    return false;
  }

  String GetUncertainKey(value) {
    bool hemipenes = value[0];
    if(hemipenes) {
      return 'VentsMale';
    } else {
      return 'VentsBoth';
    }
  }

}

class SpeciesDataSubcaudals {
  final int maleMin;
  final int maleMax;
  final int femaleMin;
  final int femaleMax;
  final int bothMin;
  final int bothMax;
  const SpeciesDataSubcaudals(
      {
        this.maleMin = -1,
        this.maleMax = -1,
        this.femaleMin = -1,
        this.femaleMax = -1,
        this.bothMin = -1,
        this.bothMax = -1
      });

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter[1].toString();
    bool hemipenes = filter[0];
    String speciesText = '';

    if (hemipenes) {
      speciesText =
          'Males: ' + this.maleMin.toString() + '-' + this.maleMax.toString();
    } else {
      speciesText =
          '' + this.bothMin.toString() + '-' + this.bothMax.toString();
    }

    return {
      'Label': 'Subcaudals',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(filter) {
    bool hemipenes = filter[0];
    if (hemipenes) {
      if (filter[1] >= this.maleMin && filter[1] <= this.maleMax) {
        return true;
      }
    } else {
      if (filter[1] >= this.bothMin && filter[1] <= this.bothMax) {
        return true;
      }
    }
    return false;
  }

  String GetUncertainKey(value) {
    bool hemipenes = value[0];
    if(hemipenes) {
      return 'SubcaudalsMale';
    } else {
      return 'SubcaudalsBoth';
    }
  }
}

class SpeciesDataTail {
  final bool isGradual;
  final bool isIntermediate;
  final bool isAbrupt;
  const SpeciesDataTail({required this.isGradual, required this.isIntermediate, required this.isAbrupt});

  Map<String, dynamic> getTableObject(filter, Species species) {
    String pickedText = filter.toString();
    List<String> speciesTextArray = [];
    if (this.isGradual) {
      speciesTextArray.add('gradual');
    }
    if (this.isIntermediate) {
      speciesTextArray.add('intermediate');
    }
    if (this.isAbrupt) {
      speciesTextArray.add('abrupt');
    }
    String speciesText = speciesTextArray.join(' or ');

    return {
      'Label': 'Tail tapering',
      'PickedValue': pickedText,
      'SpeciesValue': speciesText
    };
  }

  bool isHit(filter) {
    switch (filter) {
      case 'gradual':
        if (this.isGradual) {
          return true;
        }
        break;
      case 'intermediate':
        if (this.isIntermediate) {
          return true;
        }
        break;
      case 'abrupt':
        if (this.isAbrupt) {
          return true;
        }
        break;
    }
    return false;
  }

  String GetUncertainKey(value) {
    switch(value) {
      case 'gradual': return 'TailTaperingGradual';
      case 'intermediate': return 'TailTaperingIntermediate';
      case 'abrupt': return 'TailTaperingAbrupt';
      default:
        return '';
    }
  }
}


class SpeciesUncertain {
  String Type;
  int Level;
  String Text;
  int Points;

  SpeciesUncertain(this.Type, this.Level, this.Text, this.Points);

  factory SpeciesUncertain.fromJson(dynamic json) {
    return SpeciesUncertain(json['Type'] as String, json['Level'] as int, json['Text'] as String, json['Points'] as int);
  }
}

class SpeciesWarning {
  List<dynamic> Type;
  String Text;

  SpeciesWarning(this.Type, this.Text);

  factory SpeciesWarning.fromJson(dynamic json) {
    return SpeciesWarning(json['Type'] as List<dynamic>, json['Text'] as String);
  }
}

