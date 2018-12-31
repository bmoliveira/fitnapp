import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen(this._signUpViewModel) : super();

  SignUpViewModel _signUpViewModel;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Sign Up")),
      body: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Sign up to start monitoring things!"),
            ListTile(
              title: TextField(
                decoration: InputDecoration(hintText: "Name"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignUpViewModel {
  UserViewModel _userViewModel;

  SignUpFieldsViewModel fieldsViewModel;

  SignUpViewModel(this._userViewModel) : super() {
    fieldsViewModel = SignUpFieldsViewModel(_userViewModel);
  }
}

class SignUpFieldsViewModel extends Model {
  UserViewModel _userViewModel;

  SignUpFieldsViewModel(this._userViewModel) : super();

  String name;
  String nameError;

  void nameChanged(String name) {
    this.name = name;
  }

  bool isValid() {
    return false;
  }

  void validate() {}
}

class UserActionsModel extends Model {
  UserViewModel _userViewModel;

  UserActionsModel(this._userViewModel) : super();
}
