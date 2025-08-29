class SelectedOptions {
  static int sUpperLabials = -1,
      sLowerLabials = -1,
      sMental = -1,
      sPreocular = -1,
      sPostocular = -1,
      sSSEP = -1,
      sEyeDiam = -1,
      sHemipenes = -1,
      sVents = -1,
      sSubcaudals = -1,
      sTail = -1;
  static Set<int> sULTouchingEye = Set<int>();

  Map<String, dynamic> toJson() {
    return {
      "sUpperLabials": sUpperLabials,
      "sLowerLabials": sLowerLabials,
      "sULTouchingEye": sULTouchingEye.toList(), // need to cast for set
      "sMental": sMental == 0
          ? true
          : sMental == 1
              ? false
              : -1,
      "sPreocular": sPreocular == 0
          ? true
          : sPreocular == 1
              ? false
              : -1,
      "sPostocular": sPostocular == 0
          ? true
          : sPostocular == 1
              ? false
              : -1,
      "sSSEP": sSSEP,
      "sEyeDiam": sEyeDiam == 0
          ? "smaller"
          : sEyeDiam == 1
              ? "equal"
              : sEyeDiam == 2
                  ? "larger"
                  : -1,
      "sHemipenes": sHemipenes == 0
          ? true
          : sHemipenes == 1
              ? false
              : -1,
      "sVents": sVents,
      "sSubcaudals": sSubcaudals,
      "sTail": sTail == 0
          ? "gradual"
          : sTail == 1
              ? "intermediate"
              : sTail == 2
                  ? "abrupt"
                  : -1,
    };
  }

  void resetData() {
    sULTouchingEye = Set<int>();
    sUpperLabials = -1;
    sLowerLabials = -1;
    sMental = -1;
    sPreocular = -1;
    sPostocular = -1;
    sSSEP = -1;
    sEyeDiam = -1;
    sHemipenes = -1;
    sVents = -1;
    sSubcaudals = -1;
    sTail = -1;
  }
}
