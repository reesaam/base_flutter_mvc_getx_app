import 'dart:convert';
import 'dart:io';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';

import '../../../core/core_functions.dart';

class AppFileFunctions {
  static AppFileFunctions get to => Get.find();

  Future<String?> saveFile({
    required String fileName,
    required data,
    String? filePath,
  }) async {
    SaveFileDialogParams saveParams = SaveFileDialogParams(data: data, fileName: fileName, sourceFilePath: filePath);
    String? path = await FlutterFileDialog.saveFile(params: saveParams);
    appLogPrint('Backup File Saved');
    appDebugPrint('Filename: ${saveParams.fileName}');
    appDebugPrint('Path: ${saveParams.sourceFilePath}');
    appLogPrint('File Path: $path');
    return path;
  }

  Future<Map<String, dynamic>> pickFile({OpenFileDialogType? dialogType, SourceType? sourceType, List<String>? fileExtensionsFilter}) async {
    OpenFileDialogParams openFileParams = OpenFileDialogParams(dialogType: dialogType ?? OpenFileDialogType.document, fileExtensionsFilter: fileExtensionsFilter);
    String? importFilePath = await FlutterFileDialog.pickFile(params: openFileParams);
    File importFile = File(importFilePath!);
    String stringData = String.fromCharCodes(importFile.readAsBytesSync());
    var jsonData = json.decode(stringData) as Map<String, dynamic>;
    return jsonData;
  }
}
