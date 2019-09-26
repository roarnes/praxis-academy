

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'flavor_config.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Ready to Go')),
      body: Center(child: Text("Flavor: ${FlavorConfig.instance.name}")),
    );
  }
}