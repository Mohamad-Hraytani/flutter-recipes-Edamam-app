//import 'package:dynamic_theme/dynamic_theme.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterrecipe/SQL/Sqltest.dart';
import 'package:flutterrecipe/screens/Search.dart';

import 'package:flutterrecipe/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'SQL/mySqdb.dart';
import 'helpers/recipe.dart';
import 'screens/filters.dart';


void main()async {
  HttpOverrides.global = MyHttpOverrides();
WidgetsFlutterBinding.ensureInitialized();
  mySqdb mydb = mySqdb();
  mydb.recipedata();
  SharedPreferences prefs2 =await SharedPreferences.getInstance();
  //prefs2.clear();
//mydb.clear();




  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     
    return MultiProvider(
        providers:[ 
       ChangeNotifierProvider( // 
          create: (_) => mySqdb(),
           child: Sqltest(),),   
  ChangeNotifierProvider( // 
          create: (_) => Recipe(),
           child: HomeScreen(),),
ChangeNotifierProvider( // 
          create: (_) => Recipe(),
           child: Filters(),),

//ChangeNotifierProvider.value(value: Se()),
        ],
           child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen()),
           
           
           
           
           
           
           
    );
    
   
    
    
    
    
    
  }
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}