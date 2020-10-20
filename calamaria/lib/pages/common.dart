import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import '../classes/infoPageData.dart';
import '../classes/selectedOptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

SwipeConfiguration swipeConfig() {
  return SwipeConfiguration(
      horizontalSwipeMaxHeightThreshold: 50.0,
      horizontalSwipeMinDisplacement: 1.0,
      horizontalSwipeMinVelocity: 100.0);
}

Widget navFAB(BuildContext context, Widget next, String id) {
  return FloatingActionButton(
      child: Icon(Icons.arrow_forward),
      backgroundColor: Colors.green[600],
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
              // TODO: for debugging, can be removed later
              settings: RouteSettings(name: "idpage" + id),
              builder: (BuildContext context) => next),
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
  SchedulerBinding.instance.addPostFrameCallback((_) async {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  });
}

Widget bottomDrawer(BuildContext context) {
  InfoPageData data = new InfoPageData();
  return Drawer(
    child: ListView.builder(
        itemCount: 13,
        itemBuilder: (BuildContext drawerContext, int index) {
          data.setData(index);
          return ListTile(
              leading: SvgPicture.asset(
                data.getIcon(),
                color: Colors.black,
                matchTextDirection: false,
              ),
              title: htmlNormalText(data.getHeading(), context),
              onTap: () {
                Navigator.pop(
                    drawerContext); // close menu or it will appear when going back
                // TODO: compare index to current page somehow and don't push if already on page
                if (index == 0) {
                  reInitIdPage(
                      context); // clear data when going to id page from menu
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        // TODO: for debugging, can be removed later
                        settings:
                            RouteSettings(name: "infopage" + index.toString()),
                        builder: (context) =>
                            index == 1 ? PageListSpecies() : InfoPage(index)),
                  );
                }
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
      // only open local imgs, skip data srcs for eg. external link icon
      if (src.startsWith("asset:")) {
        // remove "asset:" from local images
        path = src.split("asset:")[1];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FullScreenImage(photoUrl: path)));
      }
    },
    onLinkTap: (url) {
      _launchURL(url);
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
