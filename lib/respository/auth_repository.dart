import 'package:mvvm_basic/data/network/BaseApiService.dart';
import 'package:mvvm_basic/data/network/NetworkApiService.dart';
import 'package:mvvm_basic/res/app_url.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          apiServices.getPostApiResponse(AppUrl.logInEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
      apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

}
