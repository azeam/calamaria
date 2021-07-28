import 'package:calamaria/pages/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'getQuote.dart';

Widget versionPage(BuildContext context) {
  return Container(
    child: Column(children: [
      FutureBuilder(
          future: getQuote(),
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
