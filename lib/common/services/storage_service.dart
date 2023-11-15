import 'package:appbloc_02/common/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  // ignore: unused_field
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }
  Future<bool>setBool(String key , bool value) async{
    return await _prefs.setBool(key, value);
  }
  Future<bool>setString(String key ,String value) async{
    return await _prefs.setString(key, value);
  }
  bool getDeviceFirstOpen(){
    return _prefs.getBool(AppGlobal.STORAGE_DEVICE_OPEN_FIRTS_TIME)??false;
  }
  bool getIsLoggedIn(){
    return _prefs.getString(AppGlobal.STORAGE_DEVICE_OPEN_TOKEN_USER)==null?false:true;
  }
}
