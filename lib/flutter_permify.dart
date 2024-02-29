library flutter_permify;

import 'package:shared_preferences/shared_preferences.dart';

class Permify {
  static const String permissionsKey = 'flutter_permify_permissions';
  static const String rolesKey = 'flutter_permify_roles';

  static Future<void> setPermissions(List<String>? permissions) async {
    if (permissions == null || permissions.isEmpty) {
      throw ArgumentError('Permissions list cannot be null or empty');
    }

    // Additional validation logic as needed

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(permissionsKey, permissions);
    } catch (e) {
      // Handle exceptions
      print('Error saving permissions: $e');
      throw Exception('Failed to save permissions');
    }
  }

  static Future<List<String>> getPermissions() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(permissionsKey) ?? [];
    } catch (e) {
      // Handle exceptions
      print('Error getting permissions: $e');
      throw Exception('Failed to get permissions');
    }
  }

  static Future<bool> hasPermission(String permission) async {
    try {
      final List<String> savedPermissions = await getPermissions();
      return savedPermissions.contains(permission);
    } catch (e) {
      // Handle exceptions
      print('Error checking permission: $e');
      throw Exception('Failed to check permission');
    }
  }

  static Future<void> setRoles(List<String>? roles) async {
    if (roles == null || roles.isEmpty) {
      throw ArgumentError('Roles list cannot be null or empty');
    }

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(rolesKey, roles);
    } catch (e) {
      // Handle exceptions
      print('Error saving roles: $e');
      throw Exception('Failed to save roles');
    }
  }

  static Future<List<String>> getRoles() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(rolesKey) ?? [];
    } catch (e) {
      // Handle exceptions
      print('Error getting user role: $e');
      throw Exception('Failed to get user role');
    }
  }

  static Future<bool> hasRole(String role) async {
    try {
      final List<String> savedRoles = await getRoles();
      return savedRoles.contains(role);
    } catch (e) {
      // Handle exceptions
      print('Error checking role: $e');
      throw Exception('Failed to check role');
    }
  }

  static Future<void> clearAll() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      // Handle exceptions
      print('Error clearing all: $e');
      throw Exception('Failed to clear all');
    }
  }

  static Future<void> clearPermissions() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(permissionsKey);
    } catch (e) {
      // Handle exceptions
      print('Error clearing permissions: $e');
      throw Exception('Failed to clear permissions');
    }
  }

  static Future<void> clearUserRoles() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(rolesKey);
    } catch (e) {
      // Handle exceptions
      print('Error clearing user role: $e');
      throw Exception('Failed to clear user role');
    }
  }
}
