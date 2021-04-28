import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/services.dart';
import 'package:firebase_installations/firebase_installations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _installationId = 'Unknown';

  Future<void> getInstallationId() async {
    String id;
    
    try {
      id =
          await FirebaseInstallations.id ?? 'Unknown installation id';
    } on PlatformException {
      id = 'Failed to get installation id.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _installationId = id;
    });
  }

  Future<void> deleteInstallationId() async {
    String id;

    try {
      await FirebaseInstallations.deleteInstallationId();
      id = "Unknown";
    } on PlatformException {
      id = 'Failed to get installation id.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _installationId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin Firebase Installation ID'),
        ),
        body: Container(width: double.infinity, child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Firebase Installation ID: $_installationId\n'),
            ElevatedButton(child: Text("Get"), onPressed: getInstallationId,),
            ElevatedButton(child: Text("Delete"), onPressed: deleteInstallationId,),
          ],
        ),
        ),
      ),
      
    );
  }
}
