import 'dart:io';

import 'package:package_info/package_info.dart';

Future<List<String>> getQuote() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  String os = Platform.operatingSystem;
  String url = "";
  if (os == "android") {
    os = os[0].toUpperCase() + os.substring(1);
    url = "https://play.google.com/store/apps/details?id=com.azeam.calamaria";
  } else {
    url = "https://apps.apple.com/app/id1595132024";
  }

  String _versionPageText = """<p>This is version """ +
      version +
      """ of the "<i>Calamaria</i> of Borneo" app for """ +
      os +
      """.</p>
  
  <p>We are not sure if it will be updated. That partially depends on how many errors we learn of, what new information becomes available, and how many people offer us photos for inclusion in a (possibly) revised version.
  </p>

  <p>If you want to get in touch with us — maybe you want to discuss the identity of a snake you have photographed, let us know of a range extension, or ask about the code used in the app — try sending an email to <a href="mailto:calamariaofborneo@gmail.com">calamariaofborneo@gmail.com</a>.
  We might not check that email account very often, but we will check it eventually!
  </p>
  <p>If you would like to cite this app, here is a suggested format (tap text to copy):</p>
  """;

  String _quote =
      """Lardner, B., Hägg, D., and Larsson, A. (2021). Calamaria of Borneo - a free cell phone app for """ +
          os +
          """. Version """ +
          version +
          """. Available via """ +
          url;

  return [_versionPageText, _quote];
}
