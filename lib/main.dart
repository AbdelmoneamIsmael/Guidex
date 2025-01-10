import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:guidix/guidix.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(
    // enabled: !kReleaseMode,
    enabled: false,
    builder: (context) => const GuiDixApplication(),
  ));
}
