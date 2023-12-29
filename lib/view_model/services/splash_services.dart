import 'package:flutter/material.dart';
import 'package:mvvm_basic/utils/routes/routes_name.dart';
import 'package:mvvm_basic/view_model/user_view_model.dart';
import 'package:mvvm_basic/model/user_model.dart';


class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {

    getUserData().then((value)async {
      print(value.token);
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
