import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:micons/icons.dart';
import 'package:micons/micons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MICons Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, File> files = {};
  Map<String, String> uploadedUrls = {};

  void imagePicker() async {
    ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      files["image"] = File(image.path);
      MIconsUploader.uploadFiles(
        files: files,
        apiKey: "API_KEY",
        folder: "FOLDER_NAME",
      ).listen(
        (progress) {
          log("Progress for ${progress.fileKey} is ${progress.progress * 100}%");
          if (progress.url != null) {
            uploadedUrls[progress.fileKey] = progress.url!;
          }
          if (progress.urls != null) {
            uploadedUrls = progress.urls!;
          }
        },
        onDone: () {
          log("All files uploaded. URLs:");
          uploadedUrls.forEach((key, url) {
            log("File key: $key, URL: $url");
          });
        },
        onError: (error) {
          log('Error in upload stream: $error');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MIcons(
              icon: MiCons.badgeCheck,
              color: Colors.black,
              size: 80,
            ),
            const SizedBox(height: 40),
            const Text("Upload Files Demo"),
            TextButton(
              onPressed: () {
                imagePicker();
              },
              child: MIcons(
                icon: MiCons.icloud,
                color: Colors.black,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
