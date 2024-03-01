import 'package:flutter_permify/flutter_permify.dart';
import 'package:flutter_test/flutter_test.dart';

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
  });
}
