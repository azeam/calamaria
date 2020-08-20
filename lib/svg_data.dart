///
/// Created by Giovanni Terlingen
/// See LICENSE file for more information.
///
import 'dart:ui';

import 'package:built_path_annotations/built_path_annotations.dart';
part 'svg_data.svg_path.g.dart';

enum Upperlabial {
  ul2,
  ul3,
}

Path getPathByUpperlabial(Upperlabial upperlabial) {
  switch (upperlabial) {
    case Upperlabial.ul2:
      return SvgData.ul2;
    case Upperlabial.ul3:
      return SvgData.ul3;
  }
  return Path();
}

/// We can open our exported SVG image, then we put all SVG data we have in the
/// property it belongs to. Our build runner will create Paths for us to use
/// within the app. Run command: flutter packages pub run build_runner build
class SvgData {
  /// Height and width of the used SVG image
  static double get height => 152.70134;
  static double get width => 263.32303;

  @SvgPath(
      'm 80.303665,127.28103 2.83482,0.47247 3.590774,0.0472 c 2.045116,0.52795 3.574881,-0.66194 4.866444,-2.64584 1.099822,-1.63438 1.921952,-3.4539 2.645833,-5.33891 0.850927,-3.52173 1.64054,-7.14564 1.748139,-11.90625 0.352757,-3.85665 0.339615,-6.77242 -0.188986,-8.362722 -1.525463,-2.149379 -2.806319,-4.373204 -7.134302,-5.669643 0,0 -3.307291,-1.417412 -7.039806,-2.220611 l -1.984377,-4e-6 c -3.260045,-0.236235 -2.929314,12.80395 -2.929314,12.80395 0,0 -0.920882,2.74587 -1.795386,3.21279 -0.566965,3.05945 -2.362352,5.95313 -3.779763,8.83519 -1.250612,3.37351 -3.461747,7.15641 -1.88988,9.11869 1.275669,1.93712 7.370536,1.03943 7.370536,1.03943 z')
  static Path get ul2 => _$SvgData_ul2;

  @SvgPath(
      'm 97.690568,97.373663 c 1.141073,5.228677 0.851427,10.457347 0.377975,15.686017 -0.78869,5.04549 -2.493437,9.72455 -4.535712,14.2686 7.165799,1.00471 14.331599,2.19838 21.497389,1.74814 9.91419,-0.45634 20.57247,-1.50338 24.33222,-14.2686 2.19045,-11.69705 -3.22182,-16.219972 -11.57552,-17.38691 -8.68927,0.06564 -11.96524,0.813551 -12.99293,0.519719 0,0 -4.76114,0.318598 -6.99256,-5.338914 -2.75108,2.966659 -6.22796,4.320443 -10.110862,4.771948 z')
  static Path get ul3 => _$SvgData_ul3;
}
