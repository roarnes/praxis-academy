import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RadialExpansion(),
    );
  }
}

// #docregion AnimatedLogo
//class AnimatedLogo extends AnimatedWidget {
//  AnimatedLogo({Key key, Animation<double> animation})
//      : super(key: key, listenable: animation);
//
//  Widget build(BuildContext context) {
//    final Animation<double> animation = listenable as Animation<double>;
//    return Center(
//      child: Container(
//        margin: EdgeInsets.symmetric(vertical: 10),
//        height: animation.value,
//        width: animation.value,
//        child: FlutterLogo(),
//      ),
//    );
//  }
//}
//// #enddocregion AnimatedLogo
//
//class LogoApp extends StatefulWidget {
//  _LogoAppState createState() => _LogoAppState();
//}
//
//class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
//  Animation<double> animation;
//  AnimationController controller;
//
//  @override
//  void initState() {
//    super.initState();
//    controller =
//        AnimationController(duration: const Duration(seconds: 2), vsync: this);
//    animation = Tween<double>(begin: 0, end: 300).animate(controller);
//    controller.forward();
//  }
//
//  @override
//  Widget build(BuildContext context) => AnimatedLogo(animation: animation);
//
//  @override
//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }
//}

class Photo extends StatelessWidget {
  Photo({ Key key, this.photo, this.color, this.onTap }) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Material(
      // Slightly opaque color appears where the image has transparency.
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
          onTap: onTap,
          child: Image.asset(
            photo,
            fit: BoxFit.contain,
          )
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  }) : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context){
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child, // Photo
          ),
        ),
      ),
    );
  }

}