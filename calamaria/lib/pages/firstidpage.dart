import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';

class FirstIdPageState extends State<FirstIdPage> {
  bool _firstCheck = false;
  bool _secondCheck = false;
  bool _thirdCheck = false;

  int _firstGroup = SelectedOptions.sUpperLabials;
  int _secondGroup = SelectedOptions.sLowerLabials;

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
      SelectedOptions.sUpperLabials = value;
    });
  }

  void _handleSecondRow(int value) {
    setState(() {
      _secondGroup = value;
      SelectedOptions.sLowerLabials = value;
    });
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
                            : i == 1 ? _secondCheck : _thirdCheck,
                        onChanged: i == 0
                            ? _handleFirstCheck
                            : i == 1 ? _handleSecondCheck : _handleThirdCheck),
                  ),
                  Text(
                    options.checkOp[i],
                    style: TextStyle(fontSize: 16.0),
                  ),
                ]),
          ),
      ],
    );
  }

  Widget radioRow(int group, int row, FormPageOptions options) {
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
                  value: int.parse(options.radioOp[i]), // get val from text
                  groupValue: group,
                  onChanged: row == 1 ? _handleFirstRow : _handleSecondRow,
                ),
              ),
              Text(
                options.radioOp[i],
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    FormPageOptions options =
        FormPageOptions(); // init on each build and pass options as arg or lists will keep increasing when going back to page

    options.questions.add('Number of upper labials:');
    options.questions.add('Number of lower labials:');
    options.questions.add('Which upper labials touch the eye?');

    options.radioOp.add("4");
    options.radioOp.add("5");
    options.radioOp.add("6");

    options.checkOp.add("2nd");
    options.checkOp.add("3rd");
    options.checkOp.add("4th");

    options.mainImg = 'assets/labialscales.svg';
    options.pageDescription =
        'Bornean Calamaria have either 4 or 5 (in one species sometimes 6) upper labials (UL), and 4 or 5 lower labials (LL). The tricky part is to judge what are the most posterior of those scales (and not scales named differently). \n\nHere you provide those counts, and enter which of the upper labials are in contact with the eye. Usually two upper labials touch the eye; either the 3rd and 4th, or the 2nd and 3rd. In one species, sometimes only the 3rd UL touches the eye.';
    options.pageHeading = 'Upper and lower labials (lip scales)';
    options.pageTitle = "Page 1 of 8";

    return Scaffold(
      appBar: AppBar(
        title: Text(options.pageTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: new SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(options.pageHeading,
                  style: Theme.of(context).textTheme.headline5),
              Divider(height: 15.0, color: Colors.transparent),
              Text(options.pageDescription, style: TextStyle(fontSize: 14)),
              Divider(height: 15.0, color: Colors.transparent),
              SvgPicture.asset(
                options.mainImg,
                color: Colors.black,
                matchTextDirection: false,
              ),
              Divider(height: 15.0, color: Colors.transparent),
              Text(
                options.questions[0],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              radioRow(_firstGroup, 1, options),
              Divider(height: 10.0, color: Colors.transparent),
              Text(
                options.questions[1],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              radioRow(_secondGroup, 2, options),
              Divider(height: 10.0, color: Colors.transparent),
              Text(
                options.questions[2],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              checkRow(3, options),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(context),
      floatingActionButton: navFAB(context, SecondIdPage()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
