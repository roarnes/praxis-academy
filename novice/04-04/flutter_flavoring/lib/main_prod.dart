
import 'package:flutter/material.dart';

import 'app.dart';
import 'flavor_config.dart';

void main() {
  FlavorConfig(flavor: Flavor.PRODUCTION,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(baseUrl: "https://raw.githubusercontent.com/JHBitencourt/ready_to_go/master/lib/json/person_qa.json"));
  runApp(MyApp());
}