import 'package:calamaria/classes/selectedOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/formPageOptions.dart';
import '../main.dart';

class SeventhIdPageState extends State<SeventhIdPage> {
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

    options.questions.add('Tail tapering...');

    options.radioOp.add("Gradually");
    options.radioOp.add("Intermediately");
    options.radioOp.add("Abruptly");

    options.mainImg = 'assets/paraparietalscales.svg';
    options.pageDescription =
        'This is not about the tail length – it is about where on the tail it starts to get narrower, and how abruptly (steeply) it then narrows down. We say that the tail tapers gradually for much of the tail’s length, or abruptly near the end, or something inbetween those states.\n\nThis is a subjective character which can be difficult to score correctly. If this character results in a mis-match for an otherwise good species agreement, revisit the character state.';

    options.pageHeading = 'Shape of the tail / tail tip';
    options.pageTitle = "Page 7 of 8";
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
      floatingActionButton: navFAB(context, EighthIdPage()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
