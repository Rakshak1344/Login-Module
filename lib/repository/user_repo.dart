import 'package:auth/models/user_model.dart';
import 'package:auth/services/api_provider.dart';

class UserRepository {
  ApiProvider _apiProvider = ApiProvider();

  Future<User> createUser(
          String name, String email, String password, String age) =>
      _apiProvider.createUser(name, email, password, age);

  Future<User> loginUser(String email, String password) =>
      _apiProvider.loginUser(email, password);

  Future<User> fetchProfile() => _apiProvider.fetchProfile();

  Future<User> logoutUser() => _apiProvider.logoutUser();

  Future<User> logoutAllUser() => _apiProvider.logoutUser();

  Future<User> uploadUserAvatar(StringBuffer avatar) =>
      _apiProvider.uploadUserAvatar(avatar);

  // Future<User> updateUserProfile()=>_apiProvider.updateUserProfile(name, age, email, password);
}
