import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Future<File> urlToFile(String image) async {
  try {
    var tempDir = await getTemporaryDirectory();
    String filePath = '${tempDir.path}/downloaded_image.png';

    await Dio().download(image, filePath);

    return File(filePath);
  } catch (e) {
    throw Exception('Failed to download image: $e');
  }
}
