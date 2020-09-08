import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';

class SixthIdPageState extends State<SixthIdPage> {
  int _firstGroup = SelectedOptions.sHemipenes;
  void _handleFirstRow(int value) {
    setState(() {
      _firstGroup = value;
      SelectedOptions.sHemipenes = value;
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

    options.questions.add('Hemipenes seen?');

    options.radioOp.add("Yes");
    options.radioOp.add("No");

    options.mainImg = 'assets/paraparietalscales.svg';
    options.pageDescription =
        'Knowing the sex of the snake can help narrowing down the number of candidate species. But sexing a small snake is difficult unless you are an expert. [See link under Main Menu.]\n\nHere we ask you to say if – or if not – you observed one or two hemipenes stick out from the snake’s cloaca. This sometimes happens if a male snake coils tightly around your finger and gives it a squeeze.\n\nIf you answer ”NO”, the algorithm will consider both sexes’ ventral and subcaudal counts (which you will be given a chance to enter soon).';

    options.pageHeading = 'Hemipenes seen?';
    options.pageTitle = "Page 6 of 8";
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
      floatingActionButton: navFAB(context, SeventhIdPage()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
