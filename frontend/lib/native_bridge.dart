import 'package:flutter/services.dart';

class NativeBridge {
  static const MethodChannel _channel = MethodChannel('image_annotation');

  static Future<String?> startAnnotation(String imagePath) async {
    final String? annotatedPath = await _channel.invokeMethod(
      'startAnnotation',
      {'path': imagePath},
    );
    return annotatedPath;
  }
}
