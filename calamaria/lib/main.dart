import 'package:calamaria/pages/listSpecies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/firstidpage.dart';
import 'pages/secondidpage.dart';
import 'pages/thirdidpage.dart';
import 'pages/fourthidpage.dart';
import 'pages/fifthidpage.dart';
import 'pages/sixthidpage.dart';
import 'pages/seventhidpage.dart';
import 'pages/eighthidpage.dart';

int test = 0; // keep results from selections in a global array of some kind?

void main() => runApp(Calamaria());

class Calamaria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calamaria of Borneo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: FirstIdPage(title: 'Calamaria of Borneo'),
    );
  }
}

class FirstIdPage extends StatefulWidget {
  FirstIdPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  FirstIdPageState createState() => FirstIdPageState();
}

class SecondIdPage extends StatefulWidget {
  SecondIdPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  SecondIdPageState createState() => SecondIdPageState();
}

class ThirdIdPage extends StatefulWidget {
  ThirdIdPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  ThirdIdPageState createState() => ThirdIdPageState();
}

class PageListSpecies extends StatefulWidget {
  PageListSpecies({Key key, this.title}) : super(key: key);
  final String title;
  @override
  PageState_ListSpecies createState() => PageState_ListSpecies();
}

class FourthIdPage extends StatefulWidget {
  FourthIdPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  FourthIdPageState createState() => FourthIdPageState();
}

class FifthIdPage extends StatefulWidget {
  FifthIdPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  FifthIdPageState createState() => FifthIdPageState();
}

class SixthIdPage extends StatefulWidget {
  SixthIdPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  SixthIdPageState createState() => SixthIdPageState();
}

class SeventhIdPage extends StatefulWidget {
  SeventhIdPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  SeventhIdPageState createState() => SeventhIdPageState();
}

class EighthIdPage extends StatefulWidget {
  EighthIdPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  EighthIdPageState createState() => EighthIdPageState();
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
        // IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
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
        ),
        ListTile(
          leading: Image.asset("assets/icons/head-question.png"),
          title: const Text('Are you really sure it’s a Calamaria...?'),
        ),
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
        ),
        ListTile(
          leading: Image.asset("assets/icons/camera-time2.png"),
          title: const Text('How to take photos that allow identification'),
        ),
        ListTile(
          leading: Image.asset("assets/icons/gender.png"),
          title: const Text('How to sex a snake'),
        ),
        ListTile(
          leading: Image.asset("assets/icons/share2.png"),
          title: const Text('Share your novel records'),
        ),
        ListTile(
          leading: Image.asset("assets/icons/bug2.png"),
          title: const Text('Report bugs & inconsistencies'),
        ),
        ListTile(
          leading: Image.asset("assets/icons/drawer-sync.png"),
          title: const Text('Version and update info'),
        ),
        const ListTile(
          leading: const Icon(Icons.copyright, color: Colors.black),
          title: const Text('Copyright info & photo credits'),
        ),
        ListTile(
          leading: Image.asset("assets/icons/read.png"),
          title: const Text('Further reading'),
        ),
      ],
    ),
  );
}
