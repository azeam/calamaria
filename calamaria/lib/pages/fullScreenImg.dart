import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../main.dart';

class FullScreenImage extends State<FullScreenImageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PhotoView(
            imageProvider: AssetImage(widget.photoUrl), minScale: 1.0));
  }
}
