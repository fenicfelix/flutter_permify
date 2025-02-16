import 'package:flutter_test/flutter_test.dart';
import 'package:permify/permify.dart';

void main() {
  test('flutter_permify_test', () {
    // Test the setPermissions method
    expect(() => Permify.setPermissions(null), throwsArgumentError);
    expect(() => Permify.setPermissions([]), throwsArgumentError);
    expect(() => Permify.setPermissions(['read']), returnsNormally);
    // Test the getPermissions method
    expect(() => Permify.getPermissions(), returnsNormally);
    // Test the hasPermission method
    expect(() => Permify.hasPermission('read'), returnsNormally);
    // Test the setRoles method
    expect(() => Permify.setRoles(null), throwsArgumentError);
    expect(() => Permify.setRoles([]), throwsArgumentError);
    expect(() => Permify.setRoles(['admin']), returnsNormally);
    // Test the getRoles method
    expect(() => Permify.getRoles(), returnsNormally);
    // Test the hasRole method
    expect(() => Permify.hasRole('admin'), returnsNormally);
    // Test the setPermissionType method
    expect(() => Permify.setPermissionType('admin'), returnsNormally);
    expect(() => Permify.setPermissionType(''), throwsArgumentError);
    // Test the getPermissionType method
    expect(() => Permify.getPermissionType(), returnsNormally);
    // Test the hasPermissionType method
    expect(() => Permify.hasPermissionType('admin'), returnsNormally);
  });
}
