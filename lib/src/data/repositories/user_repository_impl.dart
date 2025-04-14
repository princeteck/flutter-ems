import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/errors/exceptions/exceptions.dart';
import '../datasources/user_local_data_source.dart';
import '../models/user/user_model.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Database database;
  final SharedPreferences sharedPreferences;
  static const String tableName = 'users';
  static const String currentUserIdKey = 'CURRENT_USER_ID';

  UserLocalDataSourceImpl({
    required this.database,
    required this.sharedPreferences,
  });

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final List<Map<String, dynamic>> result = await database.query(tableName);
      return result.map((map) => UserModel.fromJson(map)).toList();
    } catch (e) {
      throw CacheException('Failed to get users: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> getUserById(String id) async {
    try {
      final List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (result.isEmpty) {
        throw CacheException('User with ID $id not found');
      }

      return UserModel.fromJson(result.first);
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to get user: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheUsers(List<UserModel> users) async {
    try {
      await database.transaction((txn) async {
        // Clear existing users
        await txn.delete(tableName);

        // Insert all users
        for (var user in users) {
          await txn.insert(
            tableName,
            user.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
    } catch (e) {
      throw CacheException('Failed to cache users: ${e.toString()}');
    }
  }

  @override
  Future<void> addUser(UserModel user) async {
    try {
      await database.insert(
        tableName,
        user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
    } catch (e) {
      throw CacheException('Failed to add user: ${e.toString()}');
    }
  }

  @override
  Future<void> updateUser(UserModel user) async {
    try {
      final count = await database.update(
        tableName,
        user.toJson(),
        where: 'id = ?',
        whereArgs: [user.id],
      );

      if (count == 0) {
        throw CacheException('User with ID ${user.id} not found');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to update user: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      final count = await database.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (count == 0) {
        throw CacheException('User with ID $id not found');
      }

      // If current user is deleted, logout
      final currentUserId = sharedPreferences.getString(currentUserIdKey);
      if (currentUserId == id) {
        await logout();
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to delete user: ${e.toString()}');
    }
  }

  @override
  Future<List<UserModel>> searchUsers(String query) async {
    try {
      final List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'username LIKE ?',
        whereArgs: ['%$query%'],
      );

      return result.map((map) => UserModel.fromJson(map)).toList();
    } catch (e) {
      throw CacheException('Error searching for users: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> login(String username, String password) async {
    try {
      final List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'username = ? AND password = ?',
        whereArgs: [username, password],
      );

      if (result.isEmpty) {
        throw CacheException('Invalid username or password');
      }

      final user = UserModel.fromJson(result.first);

      // Set as current user
      await setCurrentUser((user.id ?? '') as String?);

      return user;
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> register(
    String username,
    String password,
    String? avatar,
  ) async {
    try {
      // Check if username already exists
      final existingUsers = await database.query(
        tableName,
        where: 'username = ?',
        whereArgs: [username],
      );

      if (existingUsers.isNotEmpty) {
        throw CacheException('Username already exists');
      }

      // Create new user
      final newUser = UserModel(
        id:
            DateTime.now().millisecondsSinceEpoch
                .toString(), // Simple ID generation
        username: username,
        password: password,
        avatar: avatar,
      );

      await addUser(newUser);

      // Set as current user
      await setCurrentUser(newUser.id);

      return newUser;
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Registration failed: ${e.toString()}');
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final currentUserId = sharedPreferences.getString(currentUserIdKey);

      if (currentUserId == null) {
        return null;
      }

      return await getUserById(currentUserId);
    } catch (e) {
      if (e is CacheException && e.toString().contains('not found')) {
        // If user was deleted or doesn't exist anymore
        await logout();
        return null;
      }
      throw CacheException('Failed to get current user: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await sharedPreferences.remove(currentUserIdKey);
    } catch (e) {
      throw CacheException('Logout failed: ${e.toString()}');
    }
  }

  @override
  Future<void> updateUserAvatar(String userId, String avatar) async {
    try {
      final user = await getUserById(userId);
      final updatedUser = user.copyWith(avatar: avatar);
      await updateUser(updatedUser);
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to update user avatar: ${e.toString()}');
    }
  }

  @override
  Future<void> setCurrentUser(String? userId) async {
    try {
      if (userId == null) {
        await sharedPreferences.remove(currentUserIdKey);
      } else {
        await sharedPreferences.setString(currentUserIdKey, userId);
      }
    } catch (e) {
      throw CacheException('Failed to set current user: ${e.toString()}');
    }
  }
}
