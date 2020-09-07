class SelectedOptions {
  static int upperLabials;
  static int lowerLabials;
  static List<int> uLTouchingEye = List<int>();
  static bool mental;
  static bool preocular;
  static bool postocular;
  static bool postFused;
  static int sSEP;
  static int eyeDiam; // Smaller, Equal, Larger
  static int vents;
  static int subcaudals;
  static int tail; // gradually, SomewhatAbruptly, Abruptly

  SelectedOptions(
      {upperLabials,
      lowerLabials,
      uLTouchingEye,
      mental,
      preocular,
      postocular,
      postFused,
      sSEP,
      eyeDiam,
      vents,
      subcaudals,
      tail});

  factory SelectedOptions.fromJson(Map<String, dynamic> parsedJson) {
    return new SelectedOptions(
      upperLabials: parsedJson['upperLabials'] ?? "",
      lowerLabials: parsedJson['lowerLabials'] ?? "",
      uLTouchingEye: parsedJson['uLTouchingEye'] ?? "",
      mental: parsedJson['mental'] ?? "",
      preocular: parsedJson['preocular'] ?? "",
      postocular: parsedJson['postocular'] ?? "",
      postFused: parsedJson['postFused'] ?? "",
      sSEP: parsedJson['sSEP'] ?? "",
      eyeDiam: parsedJson['eyeDiam'] ?? "",
      vents: parsedJson['vents'] ?? "",
      subcaudals: parsedJson['subcaudals'] ?? "",
      tail: parsedJson['tail'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "upperLabials": upperLabials,
      "lowerLabials": lowerLabials,
      "uLTouchingEye": uLTouchingEye,
      "mental": mental,
      "preocular": preocular,
      "postocular": postocular,
      "postFused": postFused,
      "sSEP": sSEP,
      "eyeDiam": eyeDiam,
      "vents": vents,
      "subcaudals": subcaudals,
      "tail": tail,
    };
  }
}
