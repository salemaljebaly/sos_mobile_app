import 'package:get_storage/get_storage.dart';

mixin CacheToken {
  // ------------------------------------------------------------------------------- //
  // save token
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheTokenKey.token.toString(), token);
    return true;
  }

  // ------------------------------------------------------------------------------- //
  // get token from local storage
  String? getToken() {
    final box = GetStorage();
    box.read(CacheTokenKey.token.toString());
  }

  // ------------------------------------------------------------------------------- //
  // remove token
  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheTokenKey.token.toString());
  }
  // ------------------------------------------------------------------------------- //
}

enum CacheTokenKey { token }
