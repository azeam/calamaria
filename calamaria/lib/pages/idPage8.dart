import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';

class IdPageState8 extends State<IdPage8> {
  String _firstGroup = SelectedOptions.sVents.toString();
  String _secondGroup = SelectedOptions.sSubcaudals.toString();

  void _handleFirstRow(String value) {
    SelectedOptions.sVents = int.parse(value);
  }

  void _handleSecondRow(String value) {
    SelectedOptions.sSubcaudals = int.parse(value);
  }

  Widget inputRow(String group, int row, FormPageOptions options) {
    return Container(
      width: 280.0,
      child: TextField(
        controller: TextEditingController()
          ..text = (group == "null"
              ? ""
              : group), // no text = "null" (!= null), show hint instead
        onChanged: row == 0 ? _handleFirstRow : _handleSecondRow,
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
    FormPageOptions options = FormPageOptions();
    options.setData(8);

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
              inputRow(_firstGroup, 0, options),
              Divider(height: 10.0, color: Colors.transparent),
              inputRow(_secondGroup, 1, options),
            ],
          ),
        ),
      ),
      bottomNavigationBar: idNavBar(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          SelectedOptions sel = SelectedOptions();
          print(sel.toJson());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
