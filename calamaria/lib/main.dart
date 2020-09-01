import 'package:calamaria/pages/listSpecies.dart';
import 'package:flutter/material.dart';
import 'pages/firstidpage.dart';
import 'pages/secondidpage.dart';
import 'pages/thirdidpage.dart';
// import 'fourthidpage.dart';
// import 'fifthidpage.dart';
// import 'sixthidpage.dart';
// import 'seventhidpage.dart';
// import 'eighthidpage.dart';

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

// class FourthIdPage extends StatefulWidget {
//   FourthIdPage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   FourthIdPageState createState() => FourthIdPageState();
// }

// class FifthIdPage extends StatefulWidget {
//   FifthIdPage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   FifthIdPageState createState() => FifthIdPageState();
// }

// class SixthIdPage extends StatefulWidget {
//   SixthIdPage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   SixthIdPageState createState() => SixthIdPageState();
// }

// class SeventhIdPage extends StatefulWidget {
//   SeventhIdPage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   SeventhIdPageState createState() => SeventhIdPageState();
// }

// class EigthIdPage extends StatefulWidget {
//   EigthIdPage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   EighthIdPageState createState() => EighthIdPageState();
// }

Widget navFAB(BuildContext context, Widget next) {
  return FloatingActionButton(
      child: Icon(Icons.arrow_forward),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => next),
        );
      });
}

Widget navBar(BuildContext context) {
  return BottomAppBar(
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
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
          icon: const Icon(Icons.delete),
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
        const ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About this app'),
        ),
        const ListTile(
          leading: const Icon(Icons.question_answer),
          title: const Text('Are you really sure it’s a Calamaria...?'),
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: Text('Species list and species accounts'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageListSpecies()),
            );
          }
        ),
        const ListTile(
          leading: const Icon(Icons.perm_identity),
          title: const Text('Identify your Calamaria'),
        ),
        const ListTile(
          leading: const Icon(Icons.photo),
          title: const Text('How to take photos that allow identification'),
        ),
        const ListTile(
          leading: const Icon(Icons.ac_unit),
          title: const Text('How to sex a snake'),
        ),
        const ListTile(
          leading: const Icon(Icons.share),
          title: const Text('Share your novel records'),
        ),
        const ListTile(
          leading: const Icon(Icons.bug_report),
          title: const Text('Report bugs & inconsistencies'),
        ),
        const ListTile(
          leading: const Icon(Icons.update),
          title: const Text('Version and update info'),
        ),
        const ListTile(
          leading: const Icon(Icons.copyright),
          title: const Text('Copyright info & photo credits'),
        ),
        const ListTile(
          leading: const Icon(Icons.book),
          title: const Text('Further reading'),
        ),
      ],
    ),
  );
}
