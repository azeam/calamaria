import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  int _thirdGroup;

  String _firstInput;
  String _secondInput;

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
        _thirdGroup = SelectedOptions.sPostFused;
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
    }
  }

  // only page 1
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
    }
  }

  void _handleSecondRow(int value) {
    setState(() {
      _secondGroup = value;
    });
    switch (_page) {
      case 1:
        SelectedOptions.sLowerLabials = value;
        break;
      case 3:
        SelectedOptions.sPostocular = value;
        break;
    }
  }

  // only page 3
  void _handleThirdRow(int value) {
    setState(() {
      _thirdGroup = value;
    });
    SelectedOptions.sPostFused = value;
  }

  // only page 8
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
                  onChanged: row == 1
                      ? _handleFirstRow
                      : row == 2 ? _handleSecondRow : _handleThirdRow,
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
    _page = widget.page;
    _setGroups();
    FormPageOptions options =
        FormPageOptions(); // init on each build and pass options as arg or lists will keep increasing when going back to page
    options.setData(_page);
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
              (_page != 8)
                  ? Column(
                      children: [
                        Text(
                          options.questions[0],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        radioRow(_firstGroup, 1, options, _page),
                      ],
                    )
                  : Column(children: [
                      Divider(height: 10.0, color: Colors.transparent),
                      inputRow(_firstInput, 0, options),
                      Divider(height: 10.0, color: Colors.transparent),
                      inputRow(_secondInput, 1, options),
                      Divider(height: 15.0, color: Colors.transparent),
                    ]),
              (_page == 1 || _page == 3)
                  ? Column(
                      children: [
                        Text(
                          options.questions[1],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        radioRow(_secondGroup, 2, options, _page),
                      ],
                    )
                  : Divider(height: 0.0, color: Colors.transparent),
              (_page == 3)
                  ? Column(
                      children: [
                        Text(
                          options.questions[2],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        radioRow(_thirdGroup, 3, options, _page),
                        Divider(height: 10.0, color: Colors.transparent),
                      ],
                    )
                  : Divider(height: 0.0, color: Colors.transparent),
              (_page == 1)
                  ? Column(
                      children: [
                        Text(
                          options.questions[1],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        checkRow(3, options),
                        Divider(height: 10.0, color: Colors.transparent),
                      ],
                    )
                  : Divider(height: 0.0, color: Colors.transparent),
            ],
          ),
        ),
      ),
      bottomNavigationBar: idNavBar(context),
      floatingActionButton: (_page != 8)
          ? navFAB(context, IdPage(_page + 1))
          : Builder(
              builder: (context) => FloatingActionButton(
                child: Icon(Icons.done),
                backgroundColor: Colors.green,
                onPressed: () {
                  SelectedOptions sel = SelectedOptions();
                  String selected = sel.toJson().toString();
                  _showToast(context, selected);
                },
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  void _showToast(BuildContext context, String selected) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(selected),
        action: SnackBarAction(
            label: 'Hide', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}