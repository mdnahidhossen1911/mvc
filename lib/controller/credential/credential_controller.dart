import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/utils/logger.dart';


class CredentialController extends GetxController {
  static CredentialController get to => Get.find<CredentialController>();

  final GetStorage _box = GetStorage();

  static const String _tokenKey = 'token';
  static const String _refreshTokenKey = 'refreshToken';
  static const String _uidKey = 'uid';


  final RxString _token = ''.obs;
  final RxString _refreshToken = ''.obs;
  final RxString _userId = ''.obs;


  String get token => _token.value;
  String get refreshToken => _refreshToken.value;
  String get userId => _userId.value;


  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void setToken(String? token) {
    _token.value = token ?? '';
  }


  Future<void> saveUserData({
    required String accessToken,
    required String refreshTokens,
  }) async {
    try {
      await _box.write(_tokenKey, accessToken);
      await _box.write(_refreshTokenKey, refreshTokens);

      _token.value = accessToken;
      _refreshToken.value = refreshTokens;
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> tempSaveUserData({
    required String accessToken,
    required String refreshTokens,
    required String uid,
  }) async {
    try {
      _token.value = accessToken;
      _refreshToken.value = refreshTokens;
      _userId.value = uid;
    } catch (e) {
      logger.e('Error saving user data: $e');
    }
  }



  Future<void> loadUserData() async {
    try {
      final String? token = _box.read(_tokenKey);
      final String? refreshToken = _box.read(_refreshTokenKey);
      final String? uid = _box.read(_uidKey);

      _token.value = token ?? '';
      _refreshToken.value = refreshToken ?? '';
      _userId.value = uid ?? '';

    } catch (e) {
      logger.e('Error loading user data: $e');
    }
  }

  Future<void> updateAccessToken({required String newToken}) async {
    try {
      _token.value = newToken;
      await _box.write(_tokenKey, newToken);
    } catch (e) {
      logger.e('Error updating access token: $e');
    }
  }


  Future<bool> isUserLoggedIn() async {
    await loadUserData();

    if (_token.value.isNotEmpty) {
      return true;
    }

    return false;
  }


  Future<void> clearUserData() async {
    try {
      await _box.remove(_tokenKey);
      await _box.remove(_refreshTokenKey);
      await _box.remove(_uidKey);


      _token.value = '';
      _refreshToken.value = '';
      _userId.value = '';
    } catch (e) {
      logger.e('Error clearing user data: $e');
    }
  }

  // Helpers
  bool isValid() => _token.value.isNotEmpty;
}