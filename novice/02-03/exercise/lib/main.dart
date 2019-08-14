import 'package:flutter/material.dart';
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
      home: MyHomePage(),
        routes: {
          "/SecondPage": (context) => new SecondPage(),
        }
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center (
        child: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
                children: <Widget>[

                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: FutureBuilder(
                      future: loadTextAsset('planets.json'),
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

                  Container (
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: loadImageAsset('solar-system-icon.png'),
                    )
                  ),

                  Container (
                    color: Colors.black,
                    padding: EdgeInsets.all(10.0),
                    child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                        iconSize: 30,
                        onPressed: (){
                          goToSecondPage(context);
                        },
                      ),

                  ),

                ]
            ),
        ),
      ),
    );
  }

  goToSecondPage(BuildContext context){
    return Navigator.pushNamed(context, '/SecondPage');
  }

  Future<String> loadTextAsset(filename) async {
    return await rootBundle.loadString('assets/$filename');
  }

  loadImageAsset(filename) {
    return AssetImage('assets/$filename');
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('Welcome to the second page!'),
      ),
    );
  }
  
}

