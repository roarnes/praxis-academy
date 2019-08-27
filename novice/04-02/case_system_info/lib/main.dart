import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() => runApp(MyApp());

String model = '' ;
String androidID = '' ;
String brand = '' ;
String device = '' ;
String manufacturer = '' ;

class MyApp extends StatefulWidget {

  DemoPage createState() => new DemoPage();
}

class DemoPage extends State<MyApp> {

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    setState(() {
      model = 'Running on ${androidInfo.model}';
      androidID = 'Android ID: ${androidInfo.androidId}';
      brand = 'Brand: ${androidInfo.brand}';
      device = 'Device: ${androidInfo.device}';
      manufacturer = 'Manufacturer: ${androidInfo.manufacturer}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Hello World App',
        home: new Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    await getDeviceInfo();
                  },
                  child: Text('Get Device Information'),
                ),
                Text(model),
                Text(androidID),
                Text(brand),
                Text(device),
                Text(manufacturer),
              ],
            ),
          )
        )
    );
  }
}
