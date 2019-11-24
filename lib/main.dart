import 'package:flutter/material.dart';
import 'package:fooditup/root_page.dart';
import 'HomePage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ViewModel.dart';
import 'ui/User/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool _initialized = false; 
  bool _loggedIn = false; 
 
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ViewModel>(
        model: ViewModel(),
        child: MaterialApp(
          title: 'Food It Up',
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: Brightness.light,
            primaryColor: Color(0xffFF416C),
            accentColor: Color(0xffFF416C),
          ),
          home: RootPage(),
        ));
  }

}
