import 'package:flutter/material.dart';

import 'dialog_image_view.dart';

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
              showBottomSheet();
              // showDialog(
              //   context: context,
              //   barrierDismissible: false,
              //   useSafeArea: false,
              //   builder: (_) => DialogShowImage(images: images),
              // );
            },
            child: Text('click'),
          ),
        ),
      ),
    );
  }
  void showBottomSheet(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      useSafeArea: true,
      clipBehavior: Clip.hardEdge,
      builder: (context) {
        return DialogShowImage(images: images);
      },
    );
  }
}
