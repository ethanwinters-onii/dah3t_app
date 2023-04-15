import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../engine/image_classification.dart';
import '../../models/natural.dart';
import '../../pages/detail_page.dart';
import '../../service/api_service.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 1.sw,
              height: 0.05.sh,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 40),
              child: BackButton(color: Colors.white),
            ),
            SizedBox(
              width: 1.sw,
              height: 0.85.sh,
              child: CameraAwesomeBuilder.awesome(
                saveConfig: SaveConfig.photoAndVideo(
                  photoPathBuilder: () => _path(CaptureMode.photo),
                  videoPathBuilder: () => _path(CaptureMode.video),
                  initialCaptureMode: CaptureMode.photo,
                ),
                filter: AwesomeFilter.AddictiveRed,
                flashMode: FlashMode.auto,
                aspectRatio: CameraAspectRatios.ratio_16_9,
                previewFit: CameraPreviewFit.fitWidth,
                onMediaTap: (mediaCapture) async {
                  // OpenFile.open(mediaCapture.filePath);
                  var file = File(mediaCapture.filePath);
                    // print(file.length());
                  final byteData = await file.readAsBytes();
                  final imageData = byteData.buffer.asByteData();
                  final prefs = await SharedPreferences.getInstance();
                  String modelPath = prefs.getString("modelpath")!;
                  final output = await ImageClassification.getOutputDict(
                      modelPath,
                      imageData.buffer.asUint8List(
                          imageData.offsetInBytes, imageData.lengthInBytes),
                      imageData.lengthInBytes);

                  List<Natural> result = await ApiService.getNaturalByKey(
                      name: output.keys.first);
                  if (mediaCapture.filePath != "" && result.isNotEmpty) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DetailPage(tag: result[0].species, e: result[0].entities[0], acc: output.values.first * 100,)));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _path(CaptureMode captureMode) async {
    final Directory extDir = await getTemporaryDirectory();
    final testDir =
        await Directory('${extDir.path}/test').create(recursive: true);
    final String fileExtension =
        captureMode == CaptureMode.photo ? 'jpg' : 'mp4';
    final String filePath =
        '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
    return filePath;
  }
}
