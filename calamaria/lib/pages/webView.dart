import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../main.dart';
import 'common.dart';

class WebViewState extends State<WebViewPage> {
  num _stackToView = 1;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: htmlAppTitle(
          """External website""",
        ),
      ),
      body: IndexedStack(
        index: _stackToView,
        key: _key,
        children: [
          Column(
            children: <Widget>[
              Flexible(
                  child: InAppWebView(
                initialUrl: widget.url,
                onLoadStop:
                    (InAppWebViewController controller, String url) async {
                  setState(() {
                    _stackToView = 0;
                  });
                },
              )),
            ],
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                ),
                Divider(height: 15.0, color: Colors.transparent),
                Center(
                  child: Text(
                    "Loading external website...",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
