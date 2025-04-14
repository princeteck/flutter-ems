import 'package:injectable/injectable.dart';

import '../models/user/user_model.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getAllUsers();

  Future<UserModel> getUserById(String id);

  Future<void> cacheUsers(List<UserModel> users);

  Future<void> addUser(UserModel user);

  Future<void> updateUser(UserModel user);

  Future<void> deleteUser(String id);

  Future<List<UserModel>> searchUsers(String query);

  Future<UserModel> login(String username, String password);

  Future<UserModel> register(String username, String password, String? avatar);

  Future<UserModel?> getCurrentUser();

  Future<void> logout();

  Future<void> updateUserAvatar(String userId, String avatar);

  Future<void> setCurrentUser(String? userId);
}

@Injectable(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final List<UserModel> _userCache = [];
  UserModel? _currentUser;

  @override
  Future<void> addUser(UserModel user) async {
    _userCache.add(user);
  }

  @override
  Future<void> cacheUsers(List<UserModel> users) async {
    _userCache.clear();
    _userCache.addAll(users);
  }

  @override
  Future<void> deleteUser(String id) async {
    _userCache.removeWhere((user) => user.id == id);
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    return _userCache;
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    return _currentUser;
  }

  @override
  Future<UserModel> getUserById(String id) async {
    return _userCache.firstWhere((user) => user.id == id);
  }

  @override
  Future<UserModel> login(String username, String password) async {
    final user = _userCache.firstWhere(
      (user) => user.username == username && user.password == password,
      orElse: () => throw Exception('Invalid username or password'),
    );
    _currentUser = user;
    return user;
  }

  @override
  Future<void> logout() async {
    _currentUser = null;
  }

  @override
  Future<UserModel> register(
    String username,
    String password,
    String? avatar,
  ) async {
    final newUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      username: username,
      password: password,
      avatar: avatar,
    );
    _userCache.add(newUser);
    return newUser;
  }

  @override
  Future<List<UserModel>> searchUsers(String query) async {
    return _userCache
        .where(
          (user) =>
              (user.username ?? '').toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  @override
  Future<void> setCurrentUser(String? userId) async {
    _currentUser =
        userId == null
            ? null
            : _userCache.firstWhere(
              (user) => user.id == userId,
              orElse: () => UserModel(),
            );
  }

  @override
  Future<void> updateUser(UserModel user) async {
    final index = _userCache.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _userCache[index] = user;
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<void> updateUserAvatar(String userId, String avatar) async {
    final user = _userCache.firstWhere(
      (user) => user.id == userId,
      orElse: () => throw Exception('User not found'),
    );
    final updatedUser = user.copyWith(avatar: avatar);
    await updateUser(updatedUser);
  }
}
