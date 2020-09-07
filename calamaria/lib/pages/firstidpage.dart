import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';

class FirstIdPageState extends State<FirstIdPage> {
  FormPageOptions options = FormPageOptions();

  bool _firstCheck = false;
  bool _secondCheck = false;
  bool _thirdCheck = false;

  int _firstGroup = -1;
  int _secondGroup = -1;

  void _firstCheckChanged(bool value) {
    setState(() => _firstCheck = value);
    (_firstCheck)
        ? SelectedOptions.uLTouchingEye.add("2nd")
        : SelectedOptions.uLTouchingEye.remove("2nd");
  }

  void _secondCheckChanged(bool value) {
    setState(() => _secondCheck = value);
    (_secondCheck)
        ? SelectedOptions.uLTouchingEye.add("3rd")
        : SelectedOptions.uLTouchingEye.remove("3rd");
  }

  void _thirdCheckChanged(bool value) {
    setState(() => _thirdCheck = value);
    (_thirdCheck)
        ? SelectedOptions.uLTouchingEye.add("4th")
        : SelectedOptions.uLTouchingEye.remove("4th");
  }

  void _handleFirstRow(int value) {
    setState(() {
      _firstGroup = value;

      switch (_firstGroup) {
        case 0:
          SelectedOptions.upperLabials = 4;
          break;
        case 1:
          SelectedOptions.upperLabials = 5;
          break;
        case 2:
          SelectedOptions.upperLabials = 6;
          break;
      }
    });
  }

  void _handleSecondRow(int value) {
    setState(() {
      _secondGroup = value;

      switch (_secondGroup) {
        case 0:
          SelectedOptions.lowerLabials = 4;
          break;
        case 1:
          SelectedOptions.lowerLabials = 5;
          break;
        case 2:
          SelectedOptions.lowerLabials = 6;
          break;
      }
    });
  }

  Widget checkRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          options.questions[2],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(value: _firstCheck, onChanged: _firstCheckChanged),
            Text(
              options.checkOp[0],
              style: TextStyle(fontSize: 16.0),
            ),
            Checkbox(value: _secondCheck, onChanged: _secondCheckChanged),
            Text(
              options.checkOp[1],
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Checkbox(value: _thirdCheck, onChanged: _thirdCheckChanged),
            Text(
              options.checkOp[1],
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ],
    );
  }

  // possible to build a list and do 'for (var option in options) Text("${option.data}")'
  // but not possible to add more than one element in the loop (?), and radio buttons need a separate text element next to it.
  // because layout options are limited
  Widget radioRow(int group, int row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          options.questions[row - 1],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: group,
              onChanged: row == 1 ? _handleFirstRow : _handleSecondRow,
            ),
            Text(
              options.radioOp[0],
              style: TextStyle(fontSize: 16.0),
            ),
            Radio(
              value: 1,
              groupValue: group,
              onChanged: row == 1 ? _handleFirstRow : _handleSecondRow,
            ),
            Text(
              options.radioOp[1],
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Radio(
              value: 2,
              groupValue: group,
              onChanged: row == 1 ? _handleFirstRow : _handleSecondRow,
            ),
            Text(
              options.radioOp[2],
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // class is redundant but makes it easier to copy pages, unused args in radioRow etc. can stay
    options.questions.add('# of upper labials:');
    options.questions.add('# of lower labials:');
    options.questions.add('Which upper\nlabials touch\nthe eye?');

    options.radioOp.add("4");
    options.radioOp.add("5");
    options.radioOp.add("6");

    options.checkOp.add("2nd");
    options.checkOp.add("3rd");
    options.checkOp.add("4th");

    options.mainImg = 'assets/labialscales.svg';
    options.pageDescription =
        'Bornean Calamaria have either 4 or 5 (in one species sometimes 6) upper labials (UL), and 4 or 5 lower labials (LL). The tricky part is to judge what are the most posterior of those scales (and not scales named differently). \n\nHere you provide those counts, and enter which of the upper labials are in contact with the eye. Usually two upper labials touch the eye; either the 3rd and 4th, or the 2nd and 3rd. In one species, sometimes only the 3rd UL touches the eye.';
    options.pageTitle = 'Upper and lower labials (lip scales)';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(options.pageTitle,
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
              radioRow(_firstGroup, 1),
              radioRow(_secondGroup, 2),
              checkRow(),
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
