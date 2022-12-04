import 'package:flutter_initializartion/api/user_api.dart';
import 'package:flutter_initializartion/model/user.dart';

class UserRepository {
  Future<bool> registerUser(User customer) async {
    return UserAPI().registerUser(customer);
  }

  Future<bool> loginUser(String email, String password) {
    return UserAPI().loginUser(email, password);
  }
}
