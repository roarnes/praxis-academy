import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HeroAnimation(),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  List<String> keynames = ['king', 'dylan', 'john', 'booker', 'simone'];

  Widget build(BuildContext context) {
    timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: ListView(
            children: _generate(this.keynames, context)
        ),
        ),
      );
  }



  List<Widget> _generate(List names, BuildContext context) {
    return List.generate(names.length, (index) => _generateItem(names[index], context, index));
  }

  Widget _generateItem(String name, BuildContext context, int index) {
    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          new PhotoHero(
                photo: 'assets/images/${keynames[index]}.jpg',
                width: 200.0,
                onTap: (){goToSecondPage(context, index);} ,
              ),
        ],
      ),

    );
  }

  goToSecondPage(BuildContext context, index){
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(name: keynames[index]),
      ),
    )
    ;
  }

}

class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String name;

  SecondPage({Key key, @required this.name}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biography'),
      ),
      body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
                children: <Widget>[
                  Container (
                      padding: EdgeInsets.all(10.0),
                      child: loadImageAsset('$name.jpg')
                  ),

                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: FutureBuilder(
                      future: loadTextAsset('$name.txt'),
                      builder: (BuildContext context, AsyncSnapshot<String> text) {
                        return new Text(
                          text.data,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0,
                          ),
                        );
                      },
                    ),
                  ),

                ]
            ),
          )
      ),
    );
  }

  Future<String> loadTextAsset(filename) async {
    return await rootBundle.loadString('assets/bio/$filename');
  }

  loadImageAsset(filename) {
    return PhotoHero(
        photo:'assets/images/$filename',
        width: 300,
    );
  }

}

