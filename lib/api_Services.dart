import 'dart:convert';
import 'dart:developer';

import 'package:get_request/user_model.dart';
import 'package:http/http.dart' as http;

import 'constant.dart';

// this file will handle the API calls and write specific methods to fetch data and parse it.

////////////////////////////////////////////////////////////////////////////

class ApiService {
  Future<List<UserModel>?> getUsers() async {//getUsers() is a custom function created by us
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body) as List<UserModel>;//converting json response into a List<UserModel>
        //this method is available in user_Model class
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
//////////////////////////////////////////////////////////////

/*
Basically in this file we are returning the object of model class which we have just created using quicktype.io website
 */