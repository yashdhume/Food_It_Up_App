import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ViewModel.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ViewModel>(
        model: ViewModel(),
        child: MaterialApp(
          title: 'Food It Up',
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: Brightness.dark,
            primaryColor: Color(0xffFF416C),
            accentColor: Color(0xffFF4B2B),
          ),
          home: HomePage(),
        ));
  }
}

