import 'package:ecommerce_pesacoder/model/user_model.dart';
import 'package:get_storage/get_storage.dart';

class CacheHelper {
  static final GetStorage _appBox = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static Future<void> write({required String key, required dynamic value}) async {
    return await _appBox.write(key, value);
  }

  static dynamic read({required String key}) {
    return _appBox.read(key);
  }

  static bool hasData({required String key}) {
    return _appBox.hasData(key);
  }

  //===============================================================
  static Future<void> cacheUserInfo({
    required String token,
    required UserModel userModel,
  }) async {
    await _cacheUserToken(token);
    await _cacheUser(userModel);
  }

  static Future<void> cacheUser({
    required UserModel userModel,
  }) async {
    await _cacheUser(userModel);
  }

  static Future<void> _cacheUser(UserModel userModel) async => await _appBox.write('userModel', userModel.toJson());

  static Future<void> _cacheUserToken(String token) async => await _appBox.write('token', token);

  static String? get getUserToken => _appBox.read('token');

  static bool get isLogged => getUserInfo != null;

  static UserModel? get getUserInfo {
    UserModel? userModel;
    try {
      if (_appBox.hasData('userModel')) {
        userModel = UserModel.fromJson(_appBox.read('userModel'));
      }
    } catch (e) {
      print(e.toString());
    }
    return userModel;
  }

  static Future<void> signOut() async => await _appBox.erase();
}
