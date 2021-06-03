import 'package:calamaria/pages/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';

Future<List<String>> _getText() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;

  String text =
      """<p>The data used in this app come mostly from the 300-page monograph by Inger & Marx (1965), “The Systematics and Evolution of the Oriental Colubrid Snakes of the Genus <i>Calamaria</i>” (Fieldiana: Zoology, volume 49). Both Robert F. (Bob) Inger (1920 - 2019) and Hymen Marx (1925 - 2009) worked at the Field Museum of Natural History in Chicago for decades. Bob had a focus on amphibians and reptiles of Borneo for much of his research career, and was already in his lifetime a legend among students of Southeast Asian herpetology. He did field work in Malaysian Borneo from the 1950’s until 2007 - indeed; he was still conducting field work in his mid-eighties! - and continued to publish papers and books until shortly before his death at age 98.
</p>

<p>You can read more about their lives and careers here:<br>
<a href="https://static1.squarespace.com/static/570d1ea37da24f381ca53c95/t/5efccb7689ed241f061df928/1593625465913/ct2020068.pdf">Obituary R. F. Inger</a>
<img src="asset:assets/icons/external.png"><br>
<a href="https://www.researchgate.net/publication/232683634_Hymen_Marx_1925-2007">Obituary H. Marx</a>
<img src="asset:assets/icons/external.png">
</p>

<p>We are indebted to all our fellow snake enthusiasts, listed below, who kindly allowed us to use their photos in this app. Any misidentifications are ours, not theirs. <strong>Photo copyright remains with the respective photographer, as credited next to the illustrations</strong>, unless explicitly stated otherwise.
</p>

<p>Anton Sorokin<br>
Benjamin Karin<br>
Chien C. Lee<br>
Christian Langner<br>
Chun Xing Wong<br>
Chung-Wei Yu<br>
Elijah Wostl<br>
Eric N. Smith<br>
Guek Hock Ping (Kurt Orionmystery)<br>
Hans Breuer<br>
Irvan Sidik<br>
Jason Luke<br>
Jenna L. Welsh<br>
Kenneth Chin<br>
Law Ing Sind<br>
Mark O’Shea<br>
Mark Read<br>
Nayana Wijayathilaka<br>
Otto Bylén Claesson<br>
Patrick Campbell<br>
Paul Hogan<br>
Robert B. Stuebing<br>
Rose Ragai<br>
Sam Howard<br>
Scott Macor<br>
Shavez Cheema<br>
Shivaram Rasu<br>
Susan Myers<br>
Toni Herpandes
</p>

<p>Photos from I. Sidik, E. Wostl and E. N. Smith were obtained through support from the US National Science Foundation (grant DEB-1146324).
<br><br>
Alan Resetar at the Field Museum kindly assisted BL with specimens for photographs appearing in this app.
<br><br>
We also wish to thank all the people with whom we have discussed <i>Calamaria</i> identification over the years, in particular Sam Howard, Attila Kobori, Benjamin Karin, Shavez Cheema, Rob Stuebing, and the late Bob Inger.
</p>

<p>We hope that this app will inspire more people to create identification “e-keys” based on multi-character matrices. If you would like to cite this app, here is a suggested format (tap text to copy):</p>

  """;
  String quote =
      """Lardner, B., Hägg, D., and Larsson, A. (2021). Calamaria of Borneo - a free cell phone app for Android and iOS. Version """ +
          version +
          """. Available via http://play.google.com/store/apps/details?id=com.azeam.calamaria and http://apple.""";

  String end = """<p>Sweden, March 2021,<br>
Björn, Dennis and Anders
</p>""";

  return [text, quote, end];
}

Widget copyrightPage(BuildContext context) {
  return Container(
    child: Column(children: [
      FutureBuilder(
          future: _getText(),
          builder: (context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.data != null) {
              return Column(children: [
                htmlNormalText(snapshot.data[0], context),
                card(snapshot.data[1], context),
                htmlNormalText(snapshot.data[2], context)
              ]);
            }
            return loading(context);
          }),
    ]),
  );
}
