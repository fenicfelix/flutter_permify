library flutter_permify;

import 'package:shared_preferences/shared_preferences.dart';

class Permify {
  /// Permissions and roles are stored in SharedPreferences
  static const String permissionsKey = 'flutter_permify_permissions';
  static const String rolesKey = 'flutter_permify_roles';

  /// Set the permissions for the current user
  static Future<void> setPermissions(List<String>? permissions) async {
    /// Check if the permissions list is null or empty
    if (permissions == null || permissions.isEmpty) {
      throw ArgumentError('Permissions list cannot be null or empty');
    }

    /// Save the permissions to SharedPreferences once the list is validated
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(permissionsKey, permissions);
    } catch (e) {
      // Handle exceptions
      print('Error saving permissions: $e');
      throw Exception('Failed to save permissions');
    }
  }

  /// Get the permissions for the current user
  static Future<List<String>> getPermissions() async {
    /// Get the permissions from SharedPreferences
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(permissionsKey) ?? [];
    } catch (e) {
      // Handle exceptions
      print('Error getting permissions: $e');
      throw Exception('Failed to get permissions');
    }
  }

  /// Check if the current user has a specific permission
  static Future<bool> hasPermission(String permission) async {
    /// Check if the permission is in the list of saved permissions
    try {
      final List<String> savedPermissions = await getPermissions();
      return savedPermissions.contains(permission);
    } catch (e) {
      // Handle exceptions
      print('Error checking permission: $e');
      throw Exception('Failed to check permission');
    }
  }

  /// Set the roles for the current user
  static Future<void> setRoles(List<String>? roles) async {
    /// Check if the roles list is null or empty
    if (roles == null || roles.isEmpty) {
      throw ArgumentError('Roles list cannot be null or empty');
    }

    /// Save the roles to SharedPreferences once the list is validated
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(rolesKey, roles);
    } catch (e) {
      // Handle exceptions
      print('Error saving roles: $e');
      throw Exception('Failed to save roles');
    }
  }

  /// Get the roles for the current user
  static Future<List<String>> getRoles() async {
    /// Get the roles from SharedPreferences
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(rolesKey) ?? [];
    } catch (e) {
      // Handle exceptions
      print('Error getting user role: $e');
      throw Exception('Failed to get user role');
    }
  }

  /// Check if the current user has a specific role
  static Future<bool> hasRole(String role) async {
    /// Check if the role is in the list of saved roles
    try {
      final List<String> savedRoles = await getRoles();
      return savedRoles.contains(role);
    } catch (e) {
      // Handle exceptions
      print('Error checking role: $e');
      throw Exception('Failed to check role');
    }
  }

  /// Clear all permissions and roles
  static Future<void> clearAll() async {
    /// Clear all permissions and roles from SharedPreferences
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      // Handle exceptions
      print('Error clearing all: $e');
      throw Exception('Failed to clear all');
    }
  }

  /// Clear all permissions
  static Future<void> clearPermissions() async {
    /// Clear all permissions from SharedPreferences
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(permissionsKey);
    } catch (e) {
      // Handle exceptions
      print('Error clearing permissions: $e');
      throw Exception('Failed to clear permissions');
    }
  }

  /// Clear all roles
  static Future<void> clearUserRoles() async {
    /// Clear all roles from SharedPreferences
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
