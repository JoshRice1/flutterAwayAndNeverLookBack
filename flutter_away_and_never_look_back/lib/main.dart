import 'package:flutter/material.dart';
import 'package:flutter_away_and_never_look_back/slides/title_page.dart';
import 'package:flutter_away_and_never_look_back/slides/who_am_i.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Away and Never Look Back'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
    int slideCounter = 0;
    late List<Widget> pages;
  @override
  void initState() {
    pages = [
      TitlePage(endOfPageCallback: moveForward, begingingOfPageCallback: moveBackward),
      WhoAmIPage(endOfPageCallback: moveForward, begingingOfPageCallback: moveBackward)
      ];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      
      appBar: AppBar(
       
        title: Text(widget.title),
      ),      
      body: Center(
        child: _getPage(),
      )
    );
  }
 Widget _getPage(){
    if(slideCounter >= pages.length){
      slideCounter = pages.length;
    }
    return pages[slideCounter];
  }

  moveForward(){
    if(slideCounter < pages.length - 1){
      setState(() {
        slideCounter ++;
      });
    }
  }

  moveBackward(){
    if(slideCounter > 0){
      setState(() {
        slideCounter --;
      });
    }
  }
 

}
