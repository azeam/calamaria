import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import '../classes/infoPageData.dart';
import '../classes/selectedOptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipedetector/swipedetector.dart';

import '../main.dart';

SwipeConfiguration swipeConfig() {
  return SwipeConfiguration(
      horizontalSwipeMaxHeightThreshold: 50.0,
      horizontalSwipeMinDisplacement: 1.0,
      horizontalSwipeMinVelocity: 100.0);
}

Widget navFAB(BuildContext context, Widget next) {
  return FloatingActionButton(
      child: Icon(Icons.arrow_forward),
      backgroundColor: Colors.green[600],
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => next),
        );
      });
}

Widget navBar(BuildContext context, bool isIdPage) {
  return BottomAppBar(
    color: Colors.blueGrey,
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            showModalBottomSheet<Null>(
              context: context,
              builder: (BuildContext context) => bottomDrawer(context),
            );
          },
        ),
        (isIdPage)
            ? IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/trash.svg",
                  color: Colors.white,
                  matchTextDirection: false,
                ),
                onPressed: () {
                  showAlert(context);
                },
              )
            : SizedBox.shrink(),
      ],
    ),
  );
}

showAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (dialogContex) {
        return Dialog(
          child: Container(
            margin: EdgeInsets.only(
                top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Clear all entered data and restart?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Divider(height: 15.0, color: Colors.transparent),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(dialogContex).pop();
                        },
                        child: Text("Cancel"),
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(dialogContex).pop();
                          SelectedOptions sel = SelectedOptions();
                          sel.resetData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Calamaria()),
                          );
                        },
                        child: Text("Continue"),
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}

Widget bottomDrawer(BuildContext context) {
  InfoPageData data = new InfoPageData();
  return Drawer(
    child: ListView.builder(
        itemCount: 13,
        itemBuilder: (BuildContext context, int index) {
          data.setData(index);
          return ListTile(
              leading: SvgPicture.asset(
                data.getIcon(),
                color: Colors.black,
                matchTextDirection: false,
              ),
              title: htmlNormalText(data.getHeading(), context),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => index == 0
                          ? Calamaria()
                          : index == 1
                              ? PageListSpecies()
                              : InfoPage(index)),
                );
              });
        }),
  );
}

Widget htmlAppTitle(String data) {
  return Html(style: {
    "h1": Style(
        color: Colors.white,
        fontSize: FontSize.xLarge,
        fontWeight: FontWeight.normal),
  }, data: """<h1>""" + data + """</h1>""");
}

Widget htmlNormalText(String data, BuildContext context) {
  return Html(
    style: {
      "div": Style(fontSize: FontSize.large, fontWeight: FontWeight.normal),
      "h3": Style(
        color: Colors.red,
      ),
    },
    data: """<div>""" + data + """</div>""",
    onImageTap: (src) {
      var path;
      src.startsWith("asset:") // remove "asset:" from local images
          ? path = src.split("asset:")[1]
          : path = src;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FullScreenImage(photoUrl: path)));
    },
    onLinkTap: (url) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WebViewPage(url: url)));
    },
  );
}
