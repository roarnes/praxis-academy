import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
\\
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home Page')),
      body: CollapsingList(),
    );
  }

}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {

  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent)
  {
    return new SizedBox.expand(child: child);
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {
  List<String> keynames = ['king', 'dylan', 'john', 'booker', 'simone', 'waits'];

  List<String> albumnames = ['Lucille', 'Rainin\' All the Time', 'You Move Me So', 'I Put a Spell on You', 'Junko Partner', 'Goodnight Irene', 'Rockin\' Pneumonia', 'Heart of Saturday Night', 'Ol\' \'55', 'Virginia Avenue', 'Martha'];

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 150.0,
        child: Container(
            color: Colors.white,
            child: Center(
                child: Text(
                  headerText,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
                )
        )
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        makeHeader('Artists'),
        SliverGrid.count(
          crossAxisCount: 3,
          children: [
            Container(
                height: 150.0,
                child: loadImageAsset(context, keynames[0])
            ),
            Container(
                height: 150.0,
                child: loadImageAsset(context, keynames[1])
            ),
            Container(
                height: 150.0,
                child: loadImageAsset(context, keynames[2])
            ),
            Container(
                height: 150.0,
                child: loadImageAsset(context, keynames[3])
            ),
            Container(
                height: 150.0,
                child: loadImageAsset(context, keynames[4])
            ),
            Container(
                height: 150.0,
                child: loadImageAsset(context, keynames[5])
            ),
          ],
        ),
        makeHeader('Albums'),
        SliverFixedExtentList(
          itemExtent: 200.0,
          delegate: SliverChildListDelegate(
            [
              GestureDetector(
                child: loadAlbumAsset(context, 'king'),
                onTap: (){goToAlbumsPage(context, 'king');},
              ),

              GestureDetector(
                child: loadAlbumAsset(context, 'simone'),
                onTap: (){goToAlbumsPage(context, 'simone');},
              ),

              GestureDetector(
                child: loadAlbumAsset(context, 'waits'),
                onTap: (){goToAlbumsPage(context, 'waits');},
              ),
            ],
          ),
        ),
        makeHeader('Songs'),
        SliverGrid(
          gridDelegate:
          new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 3.0,
          ),
          delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.grey[100 * (index % 4)],
                child: new Text('${albumnames[index]}'),
              );
            },
            childCount: albumnames.length,
          ),
        ),

      ],
    );
  }

  Future<String> loadTextAsset(filename) async {
    return await rootBundle.loadString('assets/bio/${filename}.txt');
  }

  loadImageAsset(BuildContext context, filename) {
    return PhotoHero(
      photo:'assets/images/${filename}.jpg',
      onTap: (){goToBiographyPage(context, filename);},
    );
  }

  loadAlbumAsset(BuildContext context, filename) {
    return Image.asset('assets/albums/${filename}.jpg');
  }

  goToBiographyPage(BuildContext context, name){
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BiographyPage(name: name),
      ),
    )
    ;
  }

  goToAlbumsPage(BuildContext context, name){
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumsPage(name: name),
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

class BiographyPage extends StatelessWidget {
  final String name;

  BiographyPage({Key key, @required this.name}) : super(key: key);

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
                      child: loadImageAsset('$name')
                  ),

                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: FutureBuilder(
                      future: loadTextAsset('$name'),
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
    return await rootBundle.loadString('assets/bio/${filename}.txt');
  }

  loadImageAsset(filename) {
    return PhotoHero(
      photo:'assets/images/${filename}.jpg',
    );
  }
}

class AlbumsPage extends StatelessWidget {
  final String name;
  AlbumsPage({Key key, @required this.name}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container (
                padding: EdgeInsets.all(10.0),
                child: loadAlbumAsset('$name')
          ),
      ),
    );
  }

  loadAlbumAsset(filename) {
    return PhotoHero(
      photo:'assets/albums/${filename}.jpg',
    );
  }

}