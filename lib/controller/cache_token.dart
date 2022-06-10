import 'package:get_storage/get_storage.dart';
import 'package:sos_mobile_app/model/citizen_response_model.dart';

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
    return box.read(CacheTokenKey.token.toString());
  }

  // ------------------------------------------------------------------------------- //
  // remove token
  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheTokenKey.token.toString());
  }

  // ------------------------------------------------------------------------------- //
  // remove token
  Future<void> storeCitizenData(
      CitizenResponseModel citizenResponseModel) async {
    final citizenData = GetStorage();
    await citizenData.write(
        CacheTokenKey.citizenData.toString(), citizenResponseModel);
  }
  // ------------------------------------------------------------------------------- //

}

enum CacheTokenKey { token, citizenData }
