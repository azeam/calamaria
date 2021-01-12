import 'package:calamaria/classes/infoPages/version.dart';
import 'package:flutter/material.dart';

import '../classes/infoPageData.dart';
import '../main.dart';
import 'common.dart';

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    InfoPageData page = InfoPageData();
    page.setData(widget.page);
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
              page.pageHeading == "Version & update info"
                  ? versionPage(context)
                  : htmlNormalText(page.pageDescription, context),
              Divider(height: 35.0, color: Colors.transparent),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(context, widget.page),
    );
  }
}
