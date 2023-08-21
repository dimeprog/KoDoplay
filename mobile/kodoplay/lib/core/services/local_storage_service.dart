import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSevice {
  static SharedPreferences? prefs;

  ///init method must be called before using any other method
  static initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// getter
   static bool get isTokenExist => prefs!.containsKey('TOKEN');


  /// save token to local storage
  static Future<bool> saveToken(String token) async {
    return await prefs!.setString('TOKEN', token);
  }

  /// get token from local storage
  static String? getToken() {
    return prefs!.getString('TOKEN');
  }

  
  /// save token expire time to local storage
  static Future<bool> saveTokenExpireTime() async {
    final expireTime = DateTime.now().millisecondsSinceEpoch + 3600000;
    return await prefs!.setInt('TOKEN_EXPIRE_TIME', expireTime);
  }

  /// get token expire time from local storage
  static DateTime? getTokenExpireTime() {
    final expTime = prefs!.getInt('TOKEN_EXPIRE_TIME');
    return expTime == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(expTime);
  }

 
}
