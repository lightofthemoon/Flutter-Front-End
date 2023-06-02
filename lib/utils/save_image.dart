// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<String> saveImageToNewDirectory(
    XFile? imageFile, String directoryName, String imageName) async {
  if (imageFile != null) {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String newDirectoryPath = '${appDocumentsDirectory.path}/$directoryName';
    Directory newDirectory =
        await Directory(newDirectoryPath).create(recursive: true);
    String targetPath = '${newDirectory.path}/$imageName.jpg';
    await File(imageFile.path).copy(targetPath);
    print(targetPath);
    return targetPath;
  }
  return '';
}
