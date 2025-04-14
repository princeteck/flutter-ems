import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class SecureStorage {
  Future<void> saveCurrentUserId(String userId);
  Future<String?> getCurrentUserId();
  Future<void> clearCurrentUserId();
}

@Injectable(as: SecureStorage)
class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _secureStorage;

  static const String currentUserIdKey = 'currentUserIdKey';

  SecureStorageImpl(this._secureStorage);

  @override
  Future<void> saveCurrentUserId(String userId) async {
    await _secureStorage.write(key: currentUserIdKey, value: userId.toString());
  }

  @override
  Future<String?> getCurrentUserId() async {
    final userIdStr = await _secureStorage.read(key: currentUserIdKey);
    return userIdStr;
  }

  @override
  Future<void> clearCurrentUserId() async {
    await _secureStorage.delete(key: currentUserIdKey);
  }
}
