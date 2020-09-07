class SelectedOptions {
  static int sUpperLabials,
      sLowerLabials,
      sMental,
      sPreocular,
      sSupraocular,
      sPostocular,
      sPostFused,
      sSSEP,
      sEyeDiam,
      sVents,
      sSubcaudals,
      sTail;
  static List<int> sULTouchingEye = List<int>();

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

  Map<String, dynamic> toJson() {
    return {
      "sUpperLabials": sUpperLabials,
      "sLowerLabials": sLowerLabials,
      "sULTouchingEye": sULTouchingEye,
      "sMental": sMental == 1 ? true : sMental == 0 ? false : null,
      "sPreocular": sPreocular == 1 ? true : sPreocular == 0 ? false : null,
      "sPostocular": sPostocular == 1 ? true : sPostocular == 0 ? false : null,
      "sPostFused": sPostFused == 1 ? true : sPostFused == 0 ? false : null,
      "sSSEP": sSSEP,
      "sEyeDiam": sEyeDiam,
      "sVents": sVents,
      "sSubcaudals": sSubcaudals,
      "sTail": sTail,
    };
  }
}
