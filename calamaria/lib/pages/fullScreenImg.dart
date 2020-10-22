import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../main.dart';
import 'common.dart';

class FullScreenImageState extends State<FullScreenImage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _appBarVisible;

  @override
  void initState() {
    super.initState();

    _appBarVisible = false;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      value: 1.0,
      vsync: this,
    );
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAppBarVisibility() {
    _appBarVisible = !_appBarVisible;
    _appBarVisible ? _controller.forward() : _controller.reverse();
  }

  Widget get _imageWidget {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() {
          _toggleAppBarVisibility();
        }),
        child: Container(
            child: PhotoView(
                imageProvider: AssetImage(widget.photoUrl), initialScale: 1.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Animation<Offset> offsetAnimation = new Tween<Offset>(
      begin:
          Offset(0.0, -(MediaQuery.of(context).padding.top + kToolbarHeight)),
      end: Offset(0.0, 0.0),
    ).animate(_controller);

    return Scaffold(
        body: Stack(children: <Widget>[
      _imageWidget,
      AnimatedBuilder(
          animation: offsetAnimation,
          builder: (context, child) {
            return Transform.translate(
                offset: offsetAnimation.value,
                child: Container(
                  height: MediaQuery.of(context).padding.top + kToolbarHeight,
                  child: AppBar(
                    title: htmlAppTitle(widget.title),
                  ),
                ));
          })
    ]));
  }
}
