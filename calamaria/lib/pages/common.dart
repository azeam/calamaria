import 'package:calamaria/classes/infoPageData.dart';
import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

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

Widget idNavBar(BuildContext context) {
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
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/trash.svg",
            color: Colors.white,
            matchTextDirection: false,
          ),
          onPressed: () {
            showAlert(context);
          },
        ),
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

Widget navBar(BuildContext context) {
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
      ],
    ),
  );
}

Widget bottomDrawer(BuildContext context) {
  InfoPageData data = new InfoPageData();
  return Drawer(
    child: ListView.builder(
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) {
          data.setData(index);
          return ListTile(
              leading: SvgPicture.asset(
                index == 0
                    ? "assets/icons/loupe.svg"
                    : index == 1
                        ? "assets/icons/clipboard-list.svg"
                        : data.getIcon(),
                color: Colors.black,
                matchTextDirection: false,
              ),
              title: Text(index == 0
                  ? "Identify your Calamaria"
                  : index == 1
                      ? "Species list and species accounts"
                      : data.getHeading()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => index == 0
                          ? Calamaria()
                          : index == 1 ? PageListSpecies() : InfoPage(index)),
                );
              });
        }),
  );
}
