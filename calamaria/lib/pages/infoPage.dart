import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../classes/infoPageData.dart';
import '../main.dart';
import 'common.dart';

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    InfoPageData page = InfoPageData();
    page.setData(widget.page);
    return Scaffold(
      appBar: AppBar(
        title: Text(page.pageTitle),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Divider(height: 8.0, color: Colors.transparent),
              Text(page.pageHeading,
                  style: Theme.of(context).textTheme.headline5),
              Divider(height: 15.0, color: Colors.transparent),
              for (int i = 0; i < page.images.length; i++)
                SvgPicture.asset(
                  page.images[i],
                  color: Colors.black,
                  matchTextDirection: false,
                ),
              Divider(height: 15.0, color: Colors.transparent),
              Text(page.pageDescription, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(context),
    );
  }
}
