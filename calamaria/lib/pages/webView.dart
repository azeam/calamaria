import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';
import 'common.dart';

class WebViewState extends State<WebViewPage> {
  num _stackToView = 1;
  final _key = UniqueKey();
  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  // the commented line should be fixed in webview 1.0, for when flutter_html gets updated
  // prevents IMM fallback issue
  @override
  void initState() {
    super.initState();
//    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

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
                    child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: widget.url,
                  onPageFinished: _handleLoad,
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
        )
        // TODO: using menu from external website -> identify -> move forward -> use android back button messes up the route
        // fix proper routing or remove bottom drawer?
//         bottomNavigationBar: navBar(context, false),
        );
  }
}
