import 'dart:io';

import 'package:calamaria/pages/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/style.dart';
import 'package:package_info/package_info.dart';

Future<List<String>> _getText() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  String os = Platform.operatingSystem;
  if (os == "android") {
    os = os[0].toUpperCase() + os.substring(1);
  }
  String text = """<p>This is version """ +
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

  String quote =
      """Lardner, B., Hägg, D., and Larsson, A. (2021). Calamaria of Borneo - a free cell phone app for Android and iOS. Version """ +
          version +
          """. Available via http://play.google.com/store/apps/details?id=com.azeam.calamaria and http://apple.""";

  return [text, quote];
}

Widget versionPage(BuildContext context) {
  return Container(
    child: Column(children: [
      FutureBuilder(
          future: _getText(),
          builder: (context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.data != null) {
              return Column(children: [
                htmlNormalText(snapshot.data[0], context),
                card(snapshot.data[1], context)
              ]);
            }
            return loading(context);
          }),
    ]),
  );
}
