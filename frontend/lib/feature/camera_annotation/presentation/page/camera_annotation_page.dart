import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pro_image_editor/pro_image_editor.dart';

class CameraAnnotationPage extends StatefulWidget {
  const CameraAnnotationPage({Key? key}) : super(key: key);

  @override
  State<CameraAnnotationPage> createState() => _CameraAnnotationPageState();
}

class _CameraAnnotationPageState extends State<CameraAnnotationPage> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final status = await Permission.photos.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permission denied')),
      );
      return;
    }

    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return;

    final Uint8List imageBytes = await pickedFile.readAsBytes();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProImageEditor.memory(
          imageBytes,
          callbacks: ProImageEditorCallbacks(
            onImageEditingComplete: (Uint8List editedImageBytes) async {
              await _saveImage(editedImageBytes);
              Navigator.pop(context); // Exit editor
            },
          ),
        ),
      ),
    );
  }

  Future<void> _saveImage(Uint8List imageBytes) async {
  if (Platform.isAndroid) {
    // Request permissions
    // var status = await Permission.storage.request();
    // if (!status.isGranted) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Storage permission denied')),
    //   );
    //   return;
    // }

    // Save to Downloads or Pictures folder
    final directory = Directory('/storage/emulated/0/Download'); // or 'Pictures'
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    final filePath =
        '${directory.path}/edited_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final file = File(filePath);
    await file.writeAsBytes(imageBytes);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Image saved to ${file.path}')),
    );
  } else if (Platform.isIOS) {
    // iOS: Save to app document directory
    final directory = await getApplicationDocumentsDirectory();
    final filePath =
        '${directory.path}/edited_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final file = File(filePath);
    await file.writeAsBytes(imageBytes);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Image saved locally at ${file.path}')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Photo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: Icon(Icons.photo),
              label: Text('Pick from Gallery'),
            ),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: Icon(Icons.camera_alt),
              label: Text('Take Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
