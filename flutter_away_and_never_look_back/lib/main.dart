import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_away_and_never_look_back/ui/titlePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_theme/json_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final lightThemeStr = await rootBundle.loadString('assets/lightTheme.json');
  final lightThemeJson = jsonDecode(lightThemeStr);
  final lightTheme = ThemeDecoder.decodeThemeData(lightThemeJson) ?? ThemeData();

  final darkThemeStr = await rootBundle.loadString('assets/darkTheme.json');
  final darkThemeJson = jsonDecode(darkThemeStr);
  final darkTheme = ThemeDecoder.decodeThemeData(darkThemeJson) ?? ThemeData();

  runApp(MyApp(lightTheme: lightTheme, darkTheme: darkTheme,));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.lightTheme, required this.darkTheme}) : super(key: key);
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Away!",
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', '')   
      ],
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(title: 'Flutter Away and Never Look Back'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      appBar: AppBar(
       
        title: Text(widget.title),
      ),      
      body: const Center(
       
        child: TitlePage(),
      )
       
    );
  }
}
