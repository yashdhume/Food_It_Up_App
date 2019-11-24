import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ViewModel.dart';
import 'ui/User/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool _initialized = false; 
  bool _loggedIn = false; 
  Widget handleOpen(ViewModel model){
    if (!_initialized){
      model.Initialization(); 
      _initialized = true; 
      if (!model.isSignedIn()){
        model.hasToken().then((onValue){
          if (onValue){
            _loggedIn = true; 
            return HomePage(); 
          }
          else return LoginPage(); 
        }); 
      }
    }
    return _loggedIn ? HomePage() : LoginPage(); 

  }
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
          home: LoginPage(),
        ));
  }

}
