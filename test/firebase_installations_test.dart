import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_installations/firebase_installations.dart';

void main() {
  const MethodChannel channel = MethodChannel('firebase_installations');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'foo';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('id', () async {
    expect(await FirebaseInstallations.id, 'foo');
  });
}
