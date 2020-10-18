import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Divider(height: 8.0, color: Colors.transparent),
              htmlNormalText(page.pageDescription, context),
              Divider(height: 35.0, color: Colors.transparent),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(context, false),
    );
  }
}
