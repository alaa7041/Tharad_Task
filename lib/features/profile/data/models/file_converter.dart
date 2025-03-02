import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

class FileConverter implements JsonConverter<File?, String?> {
  const FileConverter();

  @override
  File? fromJson(String? json) {
    if (json == null || json.startsWith("http")) {
      return null;
    }
    return File(json);
  }

  @override
  String? toJson(File? file) {
    return file?.path;
  }
}
