import 'package:get_storage/get_storage.dart';

import '../../constants/local_db_constant.dart';

class LocalStorageService {
  final GetStorage _getStorage = GetStorage();
  LocalStorageService();

  // remove all
  Future<void> removeAll() async {
    _getStorage.erase();
  }

  // Token
  String? get authToken {
    return _getStorage.read<String>(LocalDBConstant.token);
  }

  Future<void> saveAuthToken(String token) async {
    return _getStorage.write(LocalDBConstant.token, token);
  }

  Future<void> removeAuthToken() async {
    return _getStorage.remove(LocalDBConstant.token);
  }

  // UserId
  String? get userId {
    return _getStorage.read<String>(LocalDBConstant.userId);
  }

  Future<void> saveUserId(String userId) async {
    return _getStorage.write(LocalDBConstant.userId, userId);
  }

  Future<void> removeUserId() async {
    return _getStorage.remove(LocalDBConstant.userId);
  }

  // Username
  String? get userName {
    return _getStorage.read<String>(LocalDBConstant.userName);
  }

  Future<void> saveUserName(String userName) async {
    return _getStorage.write(LocalDBConstant.userName, userName);
  }

  Future<void> removeUserName() async {
    return _getStorage.remove(LocalDBConstant.userName);
  }

  // Job
  String? get userJob {
    return _getStorage.read<String>(LocalDBConstant.job);
  }

  Future<void> saveJob(String job) async {
    return _getStorage.write(LocalDBConstant.job, job);
  }

  Future<void> removeJob() async {
    return _getStorage.remove(LocalDBConstant.job);
  }
}
