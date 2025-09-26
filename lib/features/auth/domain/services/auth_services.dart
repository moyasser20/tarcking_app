import '../../../../core/contants/secure_storage.dart';

class AuthService {
  static const String tokenKey = 'auth_token';
  static const String rememberMeKey = 'remember_me';

  static Future<void> saveAuthToken(String token) async {
    await SecureStorage.write(key: tokenKey, value: token);
  }

  static Future<void> saveRememberMe(bool rememberMe) async {
    await SecureStorage.write(key: rememberMeKey, value: "$rememberMe");
  }

  static Future<bool> isUserAuthenticated() async {
    if (await AuthService.isLoggedIn() && await AuthService.getRememberMe() == true) {
      return true;
    }
    return false;
  }

  static Future<bool> isLoggedIn() async {
    final token = await SecureStorage.read(tokenKey);
    return token != null && token.isNotEmpty;
  }

  static Future<bool?> getRememberMe() async {
    final value = await SecureStorage.read(rememberMeKey);
    if (value == null) return null;
    if (value == "true") {
      return true;
    } else {
      return false;
    }
  }

  static Future<String?> getToken() async {
    return await SecureStorage.read(tokenKey);
  }

  static Future<void> logout() async {
    await SecureStorage.delete(tokenKey);
    await SecureStorage.delete(rememberMeKey);
  }
}
