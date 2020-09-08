import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';

class EighthIdPageState extends State<EighthIdPage> {
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
          ..text = (group == "null" ? "" : group),
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

    options.questions.add('Enter the number of ventrals:');
    options.questions.add('Enter the number of subcaudals:');

    options.mainImg = 'assets/paraparietalscales.svg';
    options.pageDescription =
        'It is virtually impossible to count how many ventral scales a living Calamaria specimen has – they move too much! It is easier with road-killed specimens unless they are too damaged. Best is to photograph the snake from below (see advice on how to do that under the Main Menu) and count scales from the photo.\n\nCounting subcaudals (they are paired in Calamaria, so only count those on one side of the tail) is also best done from photos.\n\nIt is important to start counting on the right scale; to not count the anal scale; and to not count the tail tip scute. The photo advice page gives more info on this.';

    options.pageHeading = 'Number of ventrals & subcaudals';
    options.pageTitle = "Page 8 of 8";
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
              inputRow(_firstGroup, 0, options),
              Divider(height: 10.0, color: Colors.transparent),
              inputRow(_secondGroup, 1, options),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(context),
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
