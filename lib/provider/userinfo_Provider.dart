//  Making a provider that will react with each get api call
import 'package:flutter/cupertino.dart';
import '../api_Services.dart';
import '../user_model.dart';

class UserInformationProvider with ChangeNotifier {
  bool loading = false;
  List<UserModel>? response = [];
  Future<void> getData() async {
    loading = true;
    response = (await ApiService().getUsers());
    loading = false;

    notifyListeners();
  }
}
