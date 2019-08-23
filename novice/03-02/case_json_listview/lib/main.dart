import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
      home: new HomePage()
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/todos"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]);

    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("To Dos"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: new Text(
                          '${index+1}. \t ${data[index]["title"]}',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                  ),
                  Padding (
                    padding: EdgeInsets.only(right: 10.0),
                    child: new Icon(showCompleted(index)),
                  )
                ],
              )
          );
        },
      ),
    );
  }

  showCompleted(int index){
    IconData icon;

    if (data[index]["completed"] == true){
      icon = Icons.check_circle_outline;
    }
    else {
      icon = Icons.radio_button_unchecked;
    }
    return icon;
  }
}