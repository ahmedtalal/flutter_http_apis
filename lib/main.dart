import 'package:flultter_apis/Pages/Home.dart';
import 'package:flultter_apis/RoutingModel.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp()) ;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.ID,
      routes: route ,
    );
  }
}
