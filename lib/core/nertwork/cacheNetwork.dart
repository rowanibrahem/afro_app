import 'package:shared_preferences/shared_preferences.dart';



class CacheNetwork{
  static late SharedPreferences sharedPref;
  static cachInstialization()async{
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> insertToCashe({required String key , required String value})async{
    return await sharedPref.setString(key, value);
  }

  static Future<String?> getCacheData({required String key}) async {
    return sharedPref.getString(key)??"empty";
  }

  static Future<bool> deleteCacheData({required String key})async{
    return await sharedPref.remove(key);
  }
}
