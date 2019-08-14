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
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<String> names = ['BB King', 'Bob Dylan', 'Dr. John', 'James Booker', 'Nina Simone'];
  List<String> keynames = ['king', 'dylan', 'john', 'booker', 'simone'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center (
        child: ListView(
          children: _generate(this.names, context)
        ),
      ),
    );
  }

  List<Widget> _generate(List names, BuildContext context) {
    return List.generate(names.length, (index) => _generateItem(names[index], context, index));
  }

  Widget _generateItem(String name, BuildContext context, int index) {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: GestureDetector(
                child: new Text(
                    '$name',
                    textScaleFactor: 1.5,
                ),
                onTap: (){goToSecondPage(context, index);},
              )
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
                      child: Image(
                        image: loadImageAsset('$name.jpg'),
                      )
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
    return AssetImage('assets/images/$filename');
  }

}

