import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exercise/common/theme.dart';
import 'package:exercise/models/cart.dart';
import 'package:exercise/models/catalog.dart';
import 'package:exercise/screens/cart.dart';
import 'package:exercise/screens/catalog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(builder: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            builder: (context, catalog, previousCart) =>
                CartModel(catalog, previousCart)),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}