import 'package:flutter/material.dart';
import 'package:permify/permify.dart';
import 'package:smart_edge_alert/smart_edge_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Permify Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void definePermissions() {
    setState(() {
      // ignore: avoid_print
      Permify.setPermissions(['read', 'create']);
      Permify.setPermissionType('admin');
    });
  }

  /// function to show an alert
  showAlert(String title, String message) {
    SmartEdgeAlert.show(
      context,
      gravity: SmartEdgeAlert.bottom,
      title: title,
      description: message,
      duration: SmartEdgeAlert.lengthShort,
      backgroundColor: title == "GRANTED" ? Colors.green : Colors.red,
    );
  }

  /// function to check if the user has the create permission
  void create() async {
    if (await Permify.hasPermission('create')) {
      showAlert("GRANTED", "User has create permission");
    } else {
      showAlert("DENIED", "User has no create permission");
    }
  }

  /// function to check if the user has the read permission
  void read() async {
    if (await Permify.hasPermission('read')) {
      showAlert("GRANTED", "User has read permission");
    } else {
      showAlert("DENIED", "User has no read permission");
    }
  }

  /// function to check if the user has the update permission
  void update() async {
    if (await Permify.hasPermission('update')) {
      showAlert("GRANTED", "User has update permission");
    } else {
      showAlert("DENIED", "User has no update permission");
    }
  }

  /// function to check if the user has the delete permission
  void delete() async {
    if (await Permify.hasPermission('delete')) {
      showAlert("GRANTED", "User has delete permission");
    } else {
      showAlert("DENIED", "User has no delete permission");
    }
  }

  /// function to check if user has a specific permission or permission type
  void checkPermissionOrType() async {
    if (await Permify.hasPermissionOrType('read', 'admin')) {
      showAlert("GRANTED", "User has read permission or admin permission type");
    } else {
      showAlert(
          "DENIED", "User has no read permission or admin permission type");
    }
  }

  @override
  Widget build(BuildContext context) {
    definePermissions();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // create button
              ElevatedButton(
                onPressed: () {
                  create();
                },
                child: const Text('Create'),
              ),

              /// read button
              ElevatedButton(
                onPressed: read,
                child: const Text('Read'),
              ),

              /// update button
              ElevatedButton(
                onPressed: update,
                child: const Text('Update'),
              ),

              /// delete button
              ElevatedButton(
                onPressed: delete,
                child: const Text('Delete'),
              ),

              /// has permission or permission type button
              ElevatedButton(
                onPressed: checkPermissionOrType,
                child: const Text('Check Permission or Type'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
