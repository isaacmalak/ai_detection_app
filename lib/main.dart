import 'dart:developer';

import 'package:ai_detection_app/app/camera/view/camera_page.dart';
import 'package:ai_detection_app/theme/font_wrapper.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: GoogleFonts.vt323TextTheme(
          Theme.of(context).textTheme.copyWith(),
        ),
      ),
      showSemanticsDebugger: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'AI detection App',
              style: fontWrapper(context, TextStyle()),
            ),
          ),
          body: CameraPage(),
        ),
      ),
    );
  }
}
