import 'package:crypto_tracker/Models/CryptoCurrency.dart';
import 'package:crypto_tracker/Pages/HomePage.dart';
import 'package:crypto_tracker/Providers/marketProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<MarketProvider>(
        create: (context)=> MarketProvider(),)
    ],
    child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

        ),
        home:  HomePage()
    ),
    );


  }
}
