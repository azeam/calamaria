import 'package:flutter/material.dart';

import '../classes/infoPageData.dart';
import '../classes/infoPages/version.dart';
import '../main.dart';
import 'common.dart';

InfoPageData page = InfoPageData();
int index;
String data;

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.page != null) {
      index = widget.page;
    } else {
      index =
          page.headings.indexWhere((heading) => heading == widget.pageHeading);
      print("heading found at index " + index.toString());
    }
    page.setData(index);
    if (index != -1) {
      data = page.getData(index);
    } else {
      data = "Not found";
    }
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
              page.pageHeading == "Version and update info"
                  ? versionPage(context)
                  : htmlNormalText(data, context),
              Divider(height: 35.0, color: Colors.transparent),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(context, index),
    );
  }
}
