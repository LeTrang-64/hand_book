import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:image/image.dart' as img;

// import 'dialog_image_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TestPage());
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<String> images = [
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
    'https://i.pinimg.com/1200x/9f/e4/e4/9fe4e42a2f83f78caef84579c1f1980b.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // showBottomSheet();
              // showDialog(
              //   context: context,
              //   barrierDismissible: false,
              //   useSafeArea: false,
              //   builder: (_) => DialogShowImage(images: images),
              // );
              saveImageWithPath();
            },
            child: Text('click'),
          ),
        ),
      ),
    );
  }

  Future<void> saveImageWithPath() async {
    try {
      // final status = await Permission.photosAddOnly.request();
      final String fileName =
          'Screenshots-${DateTime.now().microsecondsSinceEpoch}.jpg';
      final newImage = img.Command();
      newImage
        ..createImage(width: 300, height: 300)
        ..drawString(
          'Trang' ?? '',
          font: img.arial24,
          x: 16,
          y: 16,
          color: img.ColorRgb8(34, 49, 63),
        )
        ..encodeJpg();
      final Uint8List? byteOutput = await newImage.getBytes();
      if (byteOutput != null) {
        if (Platform.isIOS) {
          // var status = await Permission.photosAddOnly.request();
          // PhotoManager.setIgnorePermissionCheck(true);
          // PhotoManager.editor.saveImage(byteOutput, title: fileName);
          final result =
          await ImageGallerySaver.saveImage(byteOutput, name: fileName);
        }
        // PhotoManager.editor.saveImage(byteOutput, title: fileName);
      }
      // PhotoManager.presentLimited(type: RequestType.image);
    } catch (e) {}
  }

  void showBottomSheet() {
    // showModalBottomSheet(
    //   isScrollControlled: true,
    //   context: context,
    //   backgroundColor: Colors.transparent,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    //   ),
    //   useSafeArea: true,
    //   clipBehavior: Clip.hardEdge,
    //   builder: (context) {
    //     return DialogShowImage(images: images);
    //   },
    // );
  }
}
