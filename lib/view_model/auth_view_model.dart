import 'package:flutter/cupertino.dart';
import 'package:mvvm_basic/respository/auth_repository.dart';
import 'package:mvvm_basic/utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final repo = AuthRepository();
  bool _loading = false;

  bool _signuploading = false;

  bool get loading => _loading;

  bool get signuploading => _signuploading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    repo.loginApi(data).then((value) {
      setLoading(false);
      print(value.toString());
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    repo.registerApi(data).then((value) {
      setSignUpLoading(false);
      Navigator.pushNamed(context, RoutesName.login);
      print(value.toString());
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      print(error.toString());
    });
  }
}
