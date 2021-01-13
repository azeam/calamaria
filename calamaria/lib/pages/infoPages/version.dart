import 'dart:io';

import 'package:calamaria/pages/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';

Future<String> _getVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  String os = Platform.operatingSystem;
  if (os == "android") {
    os = os[0].toUpperCase() + os.substring(1);
  }
  String text = """This is version """ +
      version +
      """ of the "Calamaria of Borneo" app for """ +
      os +
      """.
  <br><br>
  We are not sure if it will be updated. That partially depends on how many errors we learn of, what new information becomes available, and how many people offer us photos for inclusion in a (possibly) revised version.
  <br><br>
  If you want to get in touch with us — maybe you want to discuss the identity of a snake you have photographed, let us know of a range extension, or ask about the code used in the app — try sending an email to <a href="mailto:calamariaofborneo@gmail.com">calamariaofborneo@gmail.com</a>.
  We might not check that email account very often, but we will check it eventually!
  <br><br>
  If you would like to cite this app, here is a suggested format:<br><br>
  Lardner, B., Hägg, D., and Larsson, A. (2021). Calamaria of Borneo – a free cell phone app for Android and iPhone. Version """ +
      version +
      """. Available via XXXXXXXXXXXXXXXXXXXXXXXXXXXX.""";
  return text;
}

Widget versionPage(BuildContext context) {
  return Container(
    child: FutureBuilder(
        future: _getVersion(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.data != null) {
            return htmlNormalText(snapshot.data, context);
          }
          return Center(child: CircularProgressIndicator());
        }),
  );
}
