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

// set global bool to handle species list/id page links in menu
// depending on how you enter (id sequence started)
// TODO: test better
bool enableSameMenu = true;

SwipeConfiguration swipeConfig() {
  return SwipeConfiguration(
      horizontalSwipeMaxHeightThreshold: 50.0,
      horizontalSwipeMinDisplacement: 1.0,
      horizontalSwipeMinVelocity: 100.0);
}

Widget navFAB(BuildContext context, Widget next) {
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
              builder: (BuildContext bottomContext) =>
                  bottomDrawer(context, curPageMenuIndex),
            );
          },
        ),
        // show trash can on id pages
        (curPageMenuIndex == 0 || enableSameMenu == false)
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
                          enableSameMenu = true;
                          if (action == "clear") {
                            Navigator.of(dialogContext).pop();
                            reInitIdPage(context);
                          } else if (action == "clearSpecies") {
                            _listAllSpecies(context);
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

void _listAllSpecies(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PageListSpecies()));
}

Widget bottomDrawer(BuildContext context, int curPageIndex) {
  InfoPageData data = new InfoPageData();
  return Drawer(
    child: ListView.builder(
        itemCount: data.getMenuSize(),
        itemBuilder: (BuildContext drawerContext, int index) {
          data.setData(index);
          return Container(
              color: (index != curPageIndex) ? null : Colors.blueGrey[100],
              child: ListTile(
                  leading: SvgPicture.asset(
                    data.getIcon(),
                    color: Colors.black,
                    matchTextDirection: false,
                  ),
                  title: htmlNormalText(data.getHeading(), context),
                  onTap: () {
                    Navigator.pop(
                        drawerContext); // close menu or it will appear when going back
                    if (!enableSameMenu) {
                      if (index == 0) {
                        showAlert(
                            context,
                            "Do you want to clear all data and restart?",
                            "clear");
                      } else if (index == 1) {
                        showAlert(
                            context,
                            "Leave species results and show all species?",
                            "clearSpecies");
                      } else {
                        enableSameMenu = true;
                      }
                    }
                    // only go to page if not already active
                    if (index != curPageIndex && enableSameMenu) {
                      if (index == 0) {
                        reInitIdPage(context);
                      } else if (index == 1) {
                        _listAllSpecies(context);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoPage(page: index)),
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

Style defaultTextStyle() {
  return Style(
      fontSize: FontSize.large,
      fontWeight: FontWeight.normal,
      lineHeight: LineHeight.rem(1.2));
}

Style figCaptionTextStyle() {
  return Style(
      fontSize: FontSize.small,
      fontWeight: FontWeight.normal,
      fontFamily: 'Merriweather',
      padding: EdgeInsets.only(bottom: 20));
}

Widget card(String data, BuildContext context) {
  return Card(
    color: Colors.blueGrey[50],
    child: InkWell(
        onTap: () {
          Clipboard.setData(new ClipboardData(text: data));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Copied to clipboard'),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {},
            ),
          ));
        },
        splashColor: Colors.blueGrey[300],
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: data, style: TextStyle(fontSize: 15)),
                ],
              ),
            ))),
  );
}

Widget loading(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(child: CircularProgressIndicator()));
}

Widget htmlNormalText(String data, BuildContext context) {
  return Html(
    style: {
      "p": defaultTextStyle(),
      "li": defaultTextStyle(),
      "a": defaultTextStyle(),
      "font": Style(
          // used for author name
          fontSize: FontSize.large,
          fontWeight: FontWeight.normal,
          fontFamily: 'Merriweather'),
      "figcaption": figCaptionTextStyle(),
      "figcaption a": figCaptionTextStyle(),
      "span": Style(
        color: Colors.red,
      ),
      "h2": Style(fontWeight: FontWeight.normal),
      "td": Style(padding: EdgeInsets.only(top: 6, bottom: 6)),
      "th": data.contains("glossary below") // fix padding on glossary page
          ? Style(padding: EdgeInsets.only(top: 6))
          : Style(padding: EdgeInsets.only(bottom: 6)),
      "tr": data.contains("glossary below")
          ? Style(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)))
          : null,
      "table": Style(margin: EdgeInsets.only(top: 46))
    },
    data: data,
    onImageTap: (src, alt) {
      var path;
      // only open local imgs, skip data src for external link icon
      if (src != ("asset:assets/icons/external.png") &&
          src.startsWith("asset:")) {
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
      } else if (url.startsWith("speciesIndex")) {
        int index = int.parse(url.split("speciesIndex")[1]);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageSpeciesInfo(index)));
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
