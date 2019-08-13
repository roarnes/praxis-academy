import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
        routes: <String, WidgetBuilder>{
          "/SecondPage": (BuildContext context) => new SecondPage(title: 'Second Page'),
          MyItemsPage.routeName: (BuildContext context) => new MyItemsPage(title: "My Items Page"),
        }
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    //Scaffold provide functionality of appbar, body of app etc
    return new Scaffold(
        appBar: new AppBar(title: new Text("Stateless Widget")),
        body: new Container(
          //adding padding around card
            padding: new EdgeInsets.all(20.0),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  new MyCard(
                      title: new Text("I love Flutter", style: new TextStyle(fontSize: 20.0)),
                      icon: new Icon(Icons.favorite, size: 40.0, color: Colors.redAccent)
                  ),
                  new MyCard(
                      title: new Text("I love coding", style: new TextStyle(fontSize: 20.0)),
                      icon: new Icon(Icons.desktop_mac, size: 40.0, color: Colors.brown)
                  ),
                  new MyCard(
                      title: new Text("I love travelling", style: new TextStyle(fontSize: 20.0)),
                      icon: new Icon(Icons.airplanemode_active, size: 40.0, color: Colors.blue)
                  )
                ]
            )
        )
    );
  }
}

class MyCard extends StatelessWidget{
  final Widget title;
  final Widget icon;

  MyCard({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: (){Navigator.of(context).pushNamed("/SecondPage");},
        child: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Card(
            child: new Container(
              padding: EdgeInsets.all(5.0),
              child: new Column(
                children: <Widget>[
                  this.title,
                  this.icon,
                ],
              ),
            ),
          ),
        )
    );
  }

}

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Second Page"), backgroundColor: Colors.deepOrange),
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(Icons.home, color: Colors.blue),
                        iconSize: 70.0,
                        onPressed: null,
                      ),
                      new Text("Second Page")
                    ]
                )
            )
        )
    );
  }

  @override
  SecondPageState createState() => new SecondPageState();

}

class SecondPageState extends State<SecondPage>{
  int _counter = 0;

  void _incrementCounter() {
    Navigator.pushNamed(context, MyItemsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var button = new IconButton(icon: new Icon(Icons.access_alarm), onPressed: _onButtonPressed);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new Text('Dog'),
          new Text('Cat'),
          button
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _onButtonPressed() {
    Navigator.pushNamed(context, MyItemsPage.routeName);
  }
}

class MyItemsPage extends StatefulWidget {
  MyItemsPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/MyItemsPage";

  final String title;

  @override
  _MyItemsPageState createState() => new _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
  @override
  Widget build(BuildContext context) {
    var button = new IconButton(icon: new Icon(Icons.arrow_back), onPressed: _onButtonPressed);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Text('Item1'),
            new Text('Item2'),
            button
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _onFloatingActionButtonPressed() {
  }

  void _onButtonPressed() {
    Navigator.pop(context);
  }
}
