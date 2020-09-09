import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          icon: Image.asset("assets/icons/trash.png", color: Colors.white),
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
  return Drawer(
    child: ListView(
      children: <Widget>[
        ListTile(
            leading: Image.asset("assets/icons/info-square.png"),
            title: const Text('About this app'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage("about")),
              );
            }),
        ListTile(
            leading: Image.asset("assets/icons/head-question.png"),
            title: const Text('Are you really sure it’s a Calamaria...?'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage("sure")),
              );
            }),
        ListTile(
            leading: Image.asset("assets/icons/clipboard-list.png"),
            title: Text('Species list and species accounts'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageListSpecies()),
              );
            }),
        ListTile(
            leading: Image.asset("assets/icons/loupe.png"),
            title: const Text('Identify your Calamaria'),
            onTap: () {
              SelectedOptions sel = SelectedOptions();
              sel.resetData();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Calamaria()),
              );
            }),
        ListTile(
            leading: Image.asset("assets/icons/camera-time2.png"),
            title: const Text('How to take photos that allow identification'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage("photos")),
              );
            }),
        ListTile(
            leading: Image.asset("assets/icons/gender.png"),
            title: const Text('How to sex a snake'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage("sexing")),
              );
            }),
        ListTile(
            leading: Image.asset("assets/icons/share2.png"),
            title: const Text('Share your novel records'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage("share")),
              );
            }),
        ListTile(
            leading: Image.asset("assets/icons/bug2.png"),
            title: const Text('Report bugs & inconsistencies'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage("bugs")),
              );
            }),
        ListTile(
            leading: Image.asset("assets/icons/drawer-sync.png"),
            title: const Text('Version and update info'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage("version")),
              );
            }),
        ListTile(
            leading: const Icon(Icons.copyright, color: Colors.black),
            title: const Text('Copyright info & photo credits'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage("copyright")),
              );
            }),
        ListTile(
            leading: Image.asset("assets/icons/read.png"),
            title: const Text('Further reading'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage("reading")),
              );
            }),
      ],
    ),
  );
}
