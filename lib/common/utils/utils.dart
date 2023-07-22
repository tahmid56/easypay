import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String? text) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text ?? "Some Error Occured")));
}

Future<FilePickerResult?> pickFile({required List<String> fileTypes}) async {
  try {
    final file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: fileTypes);
    return file;
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}
