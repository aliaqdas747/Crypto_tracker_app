import 'package:crypto_tracker/Pages/HomePage.dart';
import 'package:crypto_tracker/Providers/marketProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_tracker/Providers/Theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MarketProvider>(
          create: (context) => MarketProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider("dark"),
        ),
      ],
      child:Consumer<ThemeProvider>(
    builder:(context,themeProvider, child){
      return   MaterialApp(
         debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          theme:ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: HomePage());


    },
    )



    );
  }
}
