import 'package:calamaria/pages/listSpecies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/idPage1.dart';
import 'pages/idPage2.dart';
import 'pages/idPage3.dart';
import 'pages/idPage4.dart';
import 'pages/idPage5.dart';
import 'pages/idPage6.dart';
import 'pages/idPage7.dart';
import 'pages/idPage8.dart';
import 'pages/infoPage.dart';

void main() => runApp(Calamaria());

class Calamaria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calamaria of Borneo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: IdPage1(title: 'Calamaria of Borneo'),
    );
  }
}

class IdPage1 extends StatefulWidget {
  IdPage1({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState1 createState() => IdPageState1();
}

class IdPage2 extends StatefulWidget {
  IdPage2({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState2 createState() => IdPageState2();
}

class IdPage3 extends StatefulWidget {
  IdPage3({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState3 createState() => IdPageState3();
}

class IdPage4 extends StatefulWidget {
  IdPage4({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState4 createState() => IdPageState4();
}

class IdPage5 extends StatefulWidget {
  IdPage5({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState5 createState() => IdPageState5();
}

class IdPage6 extends StatefulWidget {
  IdPage6({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState6 createState() => IdPageState6();
}

class IdPage7 extends StatefulWidget {
  IdPage7({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState7 createState() => IdPageState7();
}

class IdPage8 extends StatefulWidget {
  IdPage8({Key key, this.title}) : super(key: key);
  final String title;
  @override
  IdPageState8 createState() => IdPageState8();
}

class PageListSpecies extends StatefulWidget {
  PageListSpecies({Key key, this.title}) : super(key: key);
  final String title;
  @override
  PageState_ListSpecies createState() => PageState_ListSpecies();
}

class InfoPage extends StatefulWidget {
  InfoPage(this.page, {Key key, this.title}) : super(key: key);
  final String title;
  final String page;
  @override
  InfoPageState createState() => InfoPageState();
}

Widget navFAB(BuildContext context, Widget next) {
  return FloatingActionButton(
      child: Icon(Icons.arrow_forward),
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => next),
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
        IconButton(
          icon: Image.asset("assets/icons/trash.png", color: Colors.white),
          onPressed: () {},
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
            leading: Image.asset("assets/icons/info-circle.png"),
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
