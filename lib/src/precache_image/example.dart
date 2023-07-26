import 'package:flutter/material.dart';
import 'package:precache_image_example/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Image image1;
  late Image image2;


  @override
  void initState() {
    super.initState();
    image1 = Image.asset("assets/flutter.jpeg");
    image2 = Image.asset("assets/glass.png");

  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Flutter Precache Images Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image1,
            SizedBox(height: 50,),
            image2
          ],
        ),
      ),
    );
  }
}