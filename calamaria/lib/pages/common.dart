import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:url_launcher/url_launcher.dart';

import '../classes/infoPageData.dart';
import '../classes/selectedOptions.dart';
import '../main.dart';

IdPage idPage = new IdPage();

const externalUrlIcon =
    "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAQElEQVR42qXKwQkAIAxDUUdxtO6/RBQkQZvSi8I/pL4BoGw/XPkh4XigPmsUgh0626AjRsgxHTkUThsG2T/sIlzdTsp52kSS1wAAAABJRU5ErkJggg==";

SwipeConfiguration swipeConfig() {
  return SwipeConfiguration(
      horizontalSwipeMaxHeightThreshold: 50.0,
      horizontalSwipeMinDisplacement: 1.0,
      horizontalSwipeMinVelocity: 100.0);
}

Widget navFAB(BuildContext context, Widget next, String id) {
  return FloatingActionButton(
      child: Icon(Icons.arrow_forward),
      backgroundColor: Colors.blueGrey[700],
      onPressed: () => Navigator.push(
            context,
            CupertinoPageRoute(builder: (BuildContext context) => next),
          ));
}

Widget navBar(BuildContext context, int curPageMenuIndex) {
  return BottomAppBar(
    color: Colors.blueGrey,
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            showModalBottomSheet<Null>(
              context: context,
              builder: (BuildContext context) =>
                  bottomDrawer(context, curPageMenuIndex),
            );
          },
        ),
        // show trash can on id pages
        (curPageMenuIndex == 0)
            ? IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/trash.svg",
                  color: Colors.white,
                  matchTextDirection: false,
                ),
                onPressed: () {
                  showAlert(context,
                      "Do you want to clear all data and restart?", "clear");
                },
              )
            : SizedBox.shrink(),
      ],
    ),
  );
}

showAlert(BuildContext context, String question, String action) {
  showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          child: Container(
            margin: EdgeInsets.only(
                top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    question,
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
                          Navigator.of(dialogContext).pop();
                        },
                        child: Text("Cancel"),
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                      ),
                      FlatButton(
                        onPressed: () {
                          if (action == "clear") {
                            Navigator.of(dialogContext).pop();
                            reInitIdPage(context);
                          } else if (action == "exit") {
                            SystemNavigator.pop();
                          }
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

void reInitIdPage(BuildContext context) {
  SelectedOptions sel = SelectedOptions();
  sel.resetData();
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IdPage(page: 1),
      ));
}

Widget bottomDrawer(BuildContext context, int curPageIndex) {
  InfoPageData data = new InfoPageData();
  return Drawer(
    child: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext drawerContext, int index) {
          data.setData(index);
          return Container(
              color: (index != curPageIndex) ? null : Colors.blueGrey[100],
              child: ListTile(
                  leading: SvgPicture.asset(
                    data.icon,
                    color: Colors.black,
                    matchTextDirection: false,
                  ),
                  title: htmlNormalText(data.pageHeading, context),
                  onTap: () {
                    Navigator.pop(
                        drawerContext); // close menu or it will appear when going back
                    // only go to page if not already active
                    if (index != curPageIndex) {
                      if (index == 0) {
                        reInitIdPage(context);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => index == 1
                                  ? PageListSpecies()
                                  : InfoPage(page: index)),
                        );
                      }
                    }
                  }));
        }),
  );
}

Widget htmlAppTitle(String data) {
  return Html(style: {
    "h1": Style(
        color: Colors.white,
        fontSize: FontSize.xLarge,
        fontWeight: FontWeight.normal),
  }, data: "<h1>" + data + "</h1>");
}

Widget htmlNormalText(String data, BuildContext context) {
  return Html(
    style: {
      "div": Style(fontSize: FontSize.large, fontWeight: FontWeight.normal),
      "figcaption": Style(
          fontSize: FontSize.small,
          fontWeight: FontWeight.normal,
          fontFamily: 'Merriweather'),
      "span": Style(
        color: Colors.red,
      ),
      "h2": Style(fontWeight: FontWeight.normal)
    },
    data: data,
    onImageTap: (src, alt) {
      var path;
      // only open local imgs, skip data src for external link icon
      if (src != ("asset:assets/icons/external.png")) {
        // remove "asset:" from local images
        path = src.split("asset:")[1];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FullScreenImage(photoUrl: path, title: alt)));
      }
    },
    onLinkTap: (url) {
      if (url.startsWith("http") || url.startsWith("mailto")) {
        _launchURL(url);
      } else if (url == "idPage") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => IdPage(page: 1)));
      } else if (url == "speciesPage") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageListSpecies()));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfoPage(pageLinkText: url)));
      }
    },
  );
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
