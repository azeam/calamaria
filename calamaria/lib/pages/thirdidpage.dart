import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';

class ThirdIdPageState extends State<ThirdIdPage> {
  int _firstGroup = SelectedOptions.sPreocular;
  int _secondGroup = SelectedOptions.sPostocular;
  int _thirdGroup = SelectedOptions.sPostFused;
  int _fourthGroup = SelectedOptions.sSupraocular;

  void _handleFirstRow(int value) {
    setState(() {
      _firstGroup = value;
      SelectedOptions.sPreocular = value;
    });
  }

  void _handleSecondRow(int value) {
    setState(() {
      _secondGroup = value;
      SelectedOptions.sPostocular = value;
    });
  }

  void _handleThirdRow(int value) {
    setState(() {
      _thirdGroup = value;
      SelectedOptions.sPostFused = value;
    });
  }

  void _handleFourthRow(int value) {
    setState(() {
      _fourthGroup = value;
      SelectedOptions.sSupraocular = value;
    });
  }

  Widget radioRow(int group, int row, FormPageOptions options) {
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      value: i,
                      groupValue: group,
                      onChanged: row == 1
                          ? _handleFirstRow
                          : row == 2
                              ? _handleSecondRow
                              : row == 3 ? _handleThirdRow : _handleFourthRow,
                    ),
                  ),
                  Text(
                    options.radioOp[i],
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
        ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    FormPageOptions options = FormPageOptions();

    options.questions.add('Preocular present?');
    options.questions.add('Postocular present?');
    options.questions.add('Postocular fused\nwith supraocular?');
    options.questions.add('Supraocular present?');

    options.radioOp.add("Yes");
    options.radioOp.add("No");

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
              radioRow(_firstGroup, 1, options),
              radioRow(_secondGroup, 2, options),
              radioRow(_thirdGroup, 3, options),
              radioRow(_fourthGroup, 4, options),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(context),
      floatingActionButton: navFAB(context, FourthIdPage()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
