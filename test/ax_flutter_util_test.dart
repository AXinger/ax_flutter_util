import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';

void main() {
  const MethodChannel channel = MethodChannel('ax_flutter_util');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AxFlutterUtil.platformVersion, '42');
  });
}
