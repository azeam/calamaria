import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';

class IdPageState7 extends State<IdPage7> {
  int _firstGroup = SelectedOptions.sTail;
  void _handleFirstRow(int value) {
    setState(() {
      _firstGroup = value;
      SelectedOptions.sTail = value;
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
    options.setData(7);

    return Scaffold(
      appBar: AppBar(
        title: Text(options.pageTitle),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Divider(height: 8.0, color: Colors.transparent),
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
      floatingActionButton: navFAB(context, IdPage8()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
