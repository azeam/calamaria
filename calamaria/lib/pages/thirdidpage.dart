import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';

class ThirdIdPageState extends State<ThirdIdPage> {
  int _firstGroup = -1;
  int _secondGroup = -1;
  int _thirdGroup = -1;

  void _handleFirstRow(int value) {
    setState(() {
      _firstGroup = value;

      switch (_firstGroup) {
        case 0:
          test++;
          print(test);
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  void _handleSecondRow(int value) {
    setState(() {
      _secondGroup = value;

      switch (_secondGroup) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  void _handleThirdRow(int value) {
    setState(() {
      _thirdGroup = value;

      switch (_thirdGroup) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  Widget radioRow(
      String question, String op1, String op2, String op3, int group, int row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          question,
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
              onChanged: row == 1
                  ? _handleFirstRow
                  : row == 2 ? _handleSecondRow : _handleThirdRow,
            ),
            Text(
              op1,
              style: TextStyle(fontSize: 16.0),
            ),
            Radio(
              value: 1,
              groupValue: group,
              onChanged: row == 1
                  ? _handleFirstRow
                  : row == 2 ? _handleSecondRow : _handleThirdRow,
            ),
            Text(
              op2,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    FormPageOptions options = FormPageOptions();
    options.firstQuestion = 'Preocular present?';
    options.secondQuestion = 'Postocular present?';
    options.thirdQuestion = 'Postocular fused\nwith supraocular?';

    options.radioOp1 = "Yes";
    options.radioOp2 = "No";

    options.mainImg = 'assets/ocularscales.svg';
    options.pageDescription =
        'All Bornean Calamaria have a supraocular scale sitting above the eye. Most also have a postocular (a small scale just behind the eye). However, in some the postocular may be seamlessly fused with the supralabial – if so, that single, merged scale is called supraocular (and the postocular is considered absent). \n\nHere you focus on these scales plus the presence/absence of a preocular (a small scale sitting in front of the eye). \n\nThe pre- and postoculars can be very small, so make sure you use a good hand lens – or even better, a very good macro lens on your camera – to document their presence/absence!';
    options.pageHeading = 'Scales around the eye';
    options.pageTitle = "Page 3 of 8";
    return Scaffold(
      appBar: AppBar(
        title: Text(options.pageTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
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
              radioRow(options.firstQuestion, options.radioOp1,
                  options.radioOp2, options.radioOp3, _firstGroup, 1),
              radioRow(options.secondQuestion, options.radioOp1,
                  options.radioOp2, options.radioOp3, _secondGroup, 2),
              radioRow(options.thirdQuestion, options.radioOp1,
                  options.radioOp2, options.radioOp3, _thirdGroup, 3),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: navBar(context),
      //floatingActionButton: navFAB(context, SecondIdPage()),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
