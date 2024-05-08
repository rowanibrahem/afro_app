import 'package:shared_preferences/shared_preferences.dart';



// ignore: avoid_classes_with_only_static_members
class CacheNetwork{
  static late SharedPreferences sharedPref;
  // ignore: always_declare_return_types, type_annotate_public_apis
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
