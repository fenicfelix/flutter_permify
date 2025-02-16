# Permify

Permify is a powerful and intuitive package designed to streamline role-based access control (RBAC) and permission management in Flutter applications. Built on top of Laravel's renowned Spatie Permissions plugin, Permify offers a seamless integration with familiar concepts and practices, making it easy for Flutter developers to implement granular access control within their applications.

With Permify, you can define custom roles and assign fine-grained permissions to each role, enabling precise control over user access to different parts of your application. Whether you're building a simple mobile app or a complex enterprise solution, Permify provides the flexibility and scalability to adapt to your unique security requirements.

## Features

- **Role Management:** Define and manage roles with ease, assigning descriptive names and defining their permissions.
- **Permission Management:** Create and manage permissions at a granular level, specifying access rights for each feature or functionality.
- **Role-Based Access Control (RBAC):** Implement RBAC principles to control access to resources based on user roles, ensuring compliance with security policies.
- **Flexible Integration:** Seamlessly integrate Permify into your existing Flutter projects, leveraging its intuitive API and extensive documentation.
- **Cross-Platform Support:** Build secure Flutter applications for multiple platforms, including Android, iOS, web, and desktop, with Permify's cross-platform compatibility.

## Getting Started

To get started with Permify, make sure you have the following prerequisites:

- Flutter SDK installed on your machine
- Basic knowledge of Dart programming language
- Understanding of role-based access control (RBAC) concepts

Once you have the prerequisites, you can install the package by adding it to your `pubspec.yaml` file:

```yaml
dependencies:
  permify: ^0.0.3
```

After adding the package to your project, run the following command to install it:

```bash
flutter pub get
```

## Usage

Here's a simple example demonstrating how to use Permify to manage permissions and roles:

```dart

import 'package:flutter/material.dart';
import 'package:permify/permify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permify.setPermissions(['read', 'write', 'delete']);
  await Permify.setPermissionType('all');
  await Permify.setRoles(['admin', 'user']);
  
  bool hasPermission = await Permify.hasPermission('read');
  bool hasPermissionType = await Permify.hasPermissionType('all');
  bool hasRole = await Permify.hasRole('admin');
  
  print('Has permission to read: $hasPermission');
    
  print('Has role admin: $hasRole');
}
    
```

## Example

![Permify](https://github.com/fenicfelix/flutter_permify/blob/main/screenshots/GIF.gif)

The above example uses the `Permify` class to set permissions and roles, and then checks if a user has a specific permission or role. You can use the `Permify` class to perform various operations, such as creating permissions, assigning permissions to roles, and checking user access rights.

## Dependencies

Permify is built on top of the following packages:

- [Shared preferences plugin](https://pub.dev/packages/shared_preferences) - For storing permissions and roles
- [Smart Edge Alert](https://pub.dev/packages/smart_edge_alert) - For displaying alerts

## Inspiration

The inspiration for Permify comes from [Laravel's Spatie Permissions](https://spatie.be/docs/laravel-permission/v5/introduction) package, which is widely used in the PHP community for role-based access control. Permify aims to bring the same level of flexibility and convenience to the Flutter ecosystem, making it easier for developers to manage permissions and roles in their applications.

## Additional Information
For more information about Permify, how to contribute to the package, file issues, or get support, please visit the GitHub repository.

Contributions, bug reports, and feature requests are welcome! Feel free to submit a pull request or open an issue on GitHub.

For more detailed examples and documentation, refer to the package documentation and the /example folder.

## License
This package is licensed under the MIT License. See the LICENSE file for details.
