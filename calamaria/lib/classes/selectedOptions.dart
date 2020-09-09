class SelectedOptions {
  static int sUpperLabials,
      sLowerLabials,
      sMental,
      sPreocular,
      sPostocular,
      sPostFused,
      sSSEP,
      sEyeDiam,
      sHemipenes,
      sVents,
      sSubcaudals,
      sTail;
  static List<int> sULTouchingEye = List<int>();

  Map<String, dynamic> toJson() {
    return {
      "sUpperLabials": sUpperLabials,
      "sLowerLabials": sLowerLabials,
      "sULTouchingEye": sULTouchingEye,
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
    };
  }

  void resetData() {
    sULTouchingEye = List<int>();
    sUpperLabials = null;
    sLowerLabials = null;
    sMental = null;
    sPreocular = null;
    sPostocular = null;
    sPostFused = null;
    sSSEP = null;
    sEyeDiam = null;
    sHemipenes = null;
    sVents = null;
    sSubcaudals = null;
    sTail = null;
  }
}
