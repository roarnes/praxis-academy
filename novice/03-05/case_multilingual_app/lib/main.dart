import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // List all of the app's supported locales here
      supportedLocales: [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
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
        title: const Text('My App'),
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
        title: Text(AppLocalizations.of(context).translate('biography')),
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
                    child: Text(
                      AppLocalizations.of(context).translate('$name'),
                      style: TextStyle(fontSize: 19),
                      textAlign: TextAlign.justify,
                    ),
                  ),

                ]
            ),
          )
      ),
    );
  }

  loadImageAsset(filename) {
    return PhotoHero(
      photo:'assets/images/$filename',
      width: 300,
    );
  }

}

