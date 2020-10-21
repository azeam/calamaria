import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../main.dart';
import 'common.dart';

class FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: htmlAppTitle(widget.title)),
        body: PhotoView(
            imageProvider: AssetImage(widget.photoUrl), initialScale: 1.0));
  }
}
