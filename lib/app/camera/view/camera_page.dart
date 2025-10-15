import 'dart:developer';

import 'package:ai_detection_app/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  initCamera() async {
    try {
      controller = CameraController(cameras[0], ResolutionPreset.max);
      await controller.initialize();
      if (!mounted) setState(() {});
    } catch (e) {
      if (e is CameraException) {
        log(
          name: 'CAMERA_ERROR',
          'ERROR in initializing Camera Error code ====> ${e.code}',
        );
        if (e.code == 'CameraAccessAlreadyInUse' ||
            e.code == 'CameraAccessDenied') {
          await Future.delayed(Duration(seconds: 2));
          await initCamera();
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: Stack(
        children: [
          CameraPreview(controller),
          Positioned(
            child: ElevatedButton(
              onPressed: () {
                controller.takePicture();
              },
              child: Text('Detect'),
            ),
          ),
        ],
      ),
    );
  }
}
