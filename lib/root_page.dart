import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:fooditup/ui/User/LoginPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ViewModel.dart';
class RootPage extends StatelessWidget{
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
    return ScopedModelDescendant<ViewModel>(
      builder: (context, child, model) => handleOpen(model)
    );
  }
}