import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';

class SecondIdPageState extends State<SecondIdPage> {
  int _firstGroup = SelectedOptions.sMental;
  void _handleFirstRow(int value) {
    setState(() {
      _firstGroup = value;
      SelectedOptions.sMental = value;
    });
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
                  value: i,
                  groupValue: group,
                  onChanged: _handleFirstRow,
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
    FormPageOptions options = FormPageOptions();

    options.questions.add('Mental touching the anterior chin shields?');

    options.radioOp.add("Yes");
    options.radioOp.add("No");

    options.mainImg = 'assets/labialscales.svg';
    options.pageDescription =
        'The mental is the scale at the front of the lower jaw, just below where the tongue comes out. In some Calamaria it touches the anterior pair of chin shields; in others the first lower labials on the left and right side of the head meet behind the mental, and thereby separate the mental from the anterior chin shields. \n\nSpecify here which of those alternatives your snake exhibits.';

    options.pageHeading = 'Mental scale vs. chin shields';
    options.pageTitle = "Page 2 of 8";
    return Scaffold(
      appBar: AppBar(
        title: Text(options.pageTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: new SingleChildScrollView(
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
              Text(
                options.questions[0],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              radioRow(_firstGroup, 1, options),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(context),
      floatingActionButton: navFAB(context, ThirdIdPage()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
