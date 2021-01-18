import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'infoPages/copyright.dart';
import 'infoPages/version.dart';
import '../classes/infoPageData.dart';
import '../main.dart';
import 'common.dart';

InfoPageData page = InfoPageData();
int index;
String dataSrc;

class InfoPageState extends State<InfoPage> {
  @override
  void initState() {
    super.initState();
    if (widget.page != null) {
      index = widget.page;
    } else {
      // no index set (no menu link), find item in json and get index from there
      index = page
          .getLinkTexts()
          .indexWhere((linkText) => linkText.toString() == widget.pageLinkText);
    }
    page.setData(index);
    dataSrc = page.getData(index);
  }

  Future<String> _readFile(String filename) async {
    String path = "assets/infopages/" + filename + ".html";
    String htmlData = await rootBundle.loadString(path);
    return htmlData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: htmlAppTitle(page.pageHeading)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Divider(height: 8.0, color: Colors.transparent),
              dataSrc == "version"
                  ? versionPage(
                      context) // needs to be async to get app version, can't read as html
                  : dataSrc == "copyright"
                      ? copyrightPage(context)
                      : Container(
                          child: FutureBuilder(
                              future: _readFile(dataSrc),
                              builder:
                                  (context, AsyncSnapshot<String> snapshot) {
                                if (snapshot.data != null) {
                                  return htmlNormalText(snapshot.data, context);
                                }
                                return loading(context);
                              }),
                        ),
              Divider(height: 35.0, color: Colors.transparent),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(context, index),
    );
  }
}
