class SelectedOptions {
  static int sUpperLabials;
  static int sLowerLabials;
  static List<int> sULTouchingEye = List<int>();
  static bool sMental;
  static bool sPreocular;
  static bool sSupraocular; // not in powerpoint but should be there?
  static bool sPostocular;
  static bool sPostFused;
  static int sSSEP;
  static int sEyeDiam; // Smaller, Equal, Larger
  static int sVents;
  static int sSubcaudals;
  static int sTail; // gradually, SomewhatAbruptly, Abruptly

  SelectedOptions(
      {sUpperLabials,
      sLowerLabials,
      sULTouchingEye,
      sMental,
      sPreocular,
      sPostocular,
      sPostFused,
      sSSEP,
      sEyeDiam,
      sVents,
      sSubcaudals,
      sTail});

  factory SelectedOptions.fromJson(Map<String, dynamic> parsedJson) {
    return new SelectedOptions(
      sUpperLabials: parsedJson['upperLabials'] ?? "",
      sLowerLabials: parsedJson['lowerLabials'] ?? "",
      sULTouchingEye: parsedJson['uLTouchingEye'] ?? "",
      sMental: parsedJson['mental'] ?? "",
      sPreocular: parsedJson['preocular'] ?? "",
      sPostocular: parsedJson['postocular'] ?? "",
      sPostFused: parsedJson['postFused'] ?? "",
      sSSEP: parsedJson['sSEP'] ?? "",
      sEyeDiam: parsedJson['eyeDiam'] ?? "",
      sVents: parsedJson['vents'] ?? "",
      sSubcaudals: parsedJson['subcaudals'] ?? "",
      sTail: parsedJson['tail'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "sUpperLabials": sUpperLabials,
      "sLowerLabials": sLowerLabials,
      "sULTouchingEye": sULTouchingEye,
      "sMental": sMental,
      "sPreocular": sPreocular,
      "sPostocular": sPostocular,
      "sPostFused": sPostFused,
      "sSSEP": sSSEP,
      "sEyeDiam": sEyeDiam,
      "sVents": sVents,
      "sSubcaudals": sSubcaudals,
      "sTail": sTail,
    };
  }
}
