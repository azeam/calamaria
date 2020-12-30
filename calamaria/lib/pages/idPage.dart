import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipedetector/swipedetector.dart';

import '../classes/selectedOptions.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';
import 'common.dart';

class IdPageState extends State<IdPage> {
  bool _firstCheck = false;
  bool _secondCheck = false;
  bool _thirdCheck = false;

  int _page;
  int _firstGroup;
  int _secondGroup;

  String _firstInput;
  String _secondInput;

  @override
  void initState() {
    super.initState();
    _page = widget.page;
    // get saved values for radioboxes and inputs
    _setGroups();
    // get saved values for checkboxes, should only be necessary if not clearing data when going to identify from menu from info page, but better safe than sorry
    if (_page == 1) {
      if (SelectedOptions.sULTouchingEye.contains(2)) {
        _handleFirstCheck(true);
      }
      if (SelectedOptions.sULTouchingEye.contains(3)) {
        _handleSecondCheck(true);
      }
      if (SelectedOptions.sULTouchingEye.contains(4)) {
        _handleThirdCheck(true);
      }
    }
  }

  void _setGroups() {
    switch (_page) {
      case 1:
        _firstGroup = SelectedOptions.sUpperLabials;
        _secondGroup = SelectedOptions.sLowerLabials;
        break;
      case 2:
        _firstGroup = SelectedOptions.sMental;
        break;
      case 3:
        _firstGroup = SelectedOptions.sPreocular;
        _secondGroup = SelectedOptions.sPostocular;
        break;
      case 4:
        _firstGroup = SelectedOptions.sSSEP;
        break;
      case 5:
        _firstGroup = SelectedOptions.sEyeDiam;
        break;
      case 6:
        _firstGroup = SelectedOptions.sHemipenes;
        break;
      case 7:
        _firstGroup = SelectedOptions.sTail;
        break;
      case 8:
        _firstInput = SelectedOptions.sVents.toString();
        _secondInput = SelectedOptions.sSubcaudals.toString();
        break;
    }
  }

  // only page 1 has checkboxes
  void _handleFirstCheck(bool value) {
    setState(() => _firstCheck = value);
    (_firstCheck)
        ? SelectedOptions.sULTouchingEye.add(2)
        : SelectedOptions.sULTouchingEye.remove(2);
  }

  void _handleSecondCheck(bool value) {
    setState(() => _secondCheck = value);
    (_secondCheck)
        ? SelectedOptions.sULTouchingEye.add(3)
        : SelectedOptions.sULTouchingEye.remove(3);
  }

  void _handleThirdCheck(bool value) {
    setState(() => _thirdCheck = value);
    (_thirdCheck)
        ? SelectedOptions.sULTouchingEye.add(4)
        : SelectedOptions.sULTouchingEye.remove(4);
  }

  void _handleFirstRow(int value) {
    setState(() {
      _firstGroup = value;
    });
    switch (_page) {
      case 1:
        SelectedOptions.sUpperLabials = value;
        break;
      case 2:
        SelectedOptions.sMental = value;
        break;
      case 3:
        SelectedOptions.sPreocular = value;
        break;
      case 4:
        SelectedOptions.sSSEP = value;
        break;
      case 5:
        SelectedOptions.sEyeDiam = value;
        break;
      case 6:
        SelectedOptions.sHemipenes = value;
        break;
      case 7:
        SelectedOptions.sTail = value;
        break;
    }
  }

  // page 1 and 3
  void _handleSecondRow(int value) {
    setState(() {
      _secondGroup = value;
    });
    (_page == 1)
        ? SelectedOptions.sLowerLabials = value
        : SelectedOptions.sPostocular = value;
  }

  // only page 8 has inputs
  void _handleFirstInput(String value) {
    SelectedOptions.sVents = int.parse(value);
  }

  void _handleSecondInput(String value) {
    SelectedOptions.sSubcaudals = int.parse(value);
  }

  Widget checkRow(int row, FormPageOptions options) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < options.radioOp.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                    width: 30.0,
                    child: Checkbox(
                        value: i == 0
                            ? _firstCheck
                            : i == 1
                                ? _secondCheck
                                : _thirdCheck,
                        onChanged: i == 0
                            ? _handleFirstCheck
                            : i == 1
                                ? _handleSecondCheck
                                : _handleThirdCheck),
                  ),
                  optionText(options.checkOp[i]),
                ]),
          ),
      ],
    );
  }

  Widget radioRow(int group, int row, FormPageOptions options, int page) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (int i = 0; i < options.radioOp.length; i++)
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40.0,
                width: 30.0,
                child: Radio(
                  value: (_page == 1 || _page == 4)
                      ? int.parse(options.radioOp[i])
                      : i, // get val from text
                  groupValue: group,
                  onChanged: row == 1 ? _handleFirstRow : _handleSecondRow,
                ),
              ),
              optionText(options.radioOp[i]),
            ],
          ),
        ),
    ]);
  }

  Widget inputRow(String group, int row, FormPageOptions options) {
    return Container(
      width: 280.0,
      child: TextField(
        controller: TextEditingController()
          ..text = (group == "null"
              ? ""
              : group), // no text = "null" (!= null), show hint instead
        onChanged: row == 0 ? _handleFirstInput : _handleSecondInput,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: options.questions[row],
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FormPageOptions options =
        FormPageOptions(); // init on each build and pass options as arg or lists will keep increasing when going back to page
    options.setData(_page);
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: htmlAppTitle(
              """Identify your <i>Calamaria</i> (""" +
                  _page.toString() +
                  """ of 8)""",
            ),
          ),
          body: SwipeDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Divider(height: 10.0, color: Colors.transparent),
                    Text(options.pageHeading,
                        style: Theme.of(context).textTheme.headline5),
                    Divider(height: 8.0, color: Colors.transparent),
                    htmlNormalText(options.pageDescription, context),
                    Divider(height: 15.0, color: Colors.transparent),
                    (_page == 5 || _page == 6)
                        ? Image(image: AssetImage(options.mainImg))
                        : (_page == 8)
                            ? SizedBox.shrink()
                            : SvgPicture.asset(
                                options.mainImg,
                                matchTextDirection: false,
                              ),
                    Divider(height: 15.0, color: Colors.transparent),
                    (_page != 8)
                        ? optionRow(options.questions[0],
                            radioRow(_firstGroup, 1, options, _page))
                        : Column(children: [
                            Divider(height: 10.0, color: Colors.transparent),
                            inputRow(_firstInput, 0, options),
                            Divider(height: 10.0, color: Colors.transparent),
                            inputRow(_secondInput, 1, options),
                          ]),
                    (_page == 1 || _page == 3)
                        ? optionRow(options.questions[1],
                            radioRow(_secondGroup, 2, options, _page))
                        : SizedBox.shrink(),
                    (_page == 1)
                        ? optionRow(options.questions[2], checkRow(3, options))
                        : SizedBox.shrink(), // something empty, can't be null
                    Divider(height: 35.0, color: Colors.transparent),
                  ],
                ),
              ),
            ),
            onSwipeLeft: () {
              (_page != 8)
                  ? Navigator.push(
                      context,
                      CupertinoPageRoute(
                          settings: RouteSettings(
                              // TODO: for debugging, can be removed later
                              name: "idpage" + (_page + 1).toString()),
                          builder: (BuildContext context) =>
                              IdPage(page: _page + 1)),
                    )
                  : _listResults(context);
            },
            onSwipeRight: () {
              Navigator.maybePop(context);
            },
            swipeConfiguration: swipeConfig(),
          ),
          bottomNavigationBar: navBar(context, 0),
          floatingActionButton: (_page != 8)
              ? navFAB(context, IdPage(page: _page + 1), (_page + 1).toString())
              : Builder(
                  builder: (context) => FloatingActionButton(
                    child: Icon(Icons.done),
                    backgroundColor: Colors.blueGrey[700],
                    onPressed: () {
                      _listResults(context);
                    },
                  ),
                ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ),
        onWillPop: () {
          // not possible to programmatically exit app on iOS
          if (!Navigator.canPop(context) && Platform.isAndroid) {
            showAlert(context, "Are you sure you want to exit?", "exit");
          }
          return Future.value(true);
        });
  }
}

void _listResults(BuildContext context) {
  SelectedOptions sel = SelectedOptions();
  print(sel.toJson());
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => PageListSpecies(sel)),
  );
}

Widget optionText(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 16.0),
  );
}

Widget optionRow(String question, Widget widget) {
  return Column(
    children: [
      Text(
        question,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      widget,
      Divider(height: 10.0, color: Colors.transparent),
    ],
  );
}
