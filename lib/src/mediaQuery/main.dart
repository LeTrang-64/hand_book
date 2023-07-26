import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class TextGlobal extends StatelessWidget {
  const TextGlobal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("######## TextGlobal");
    return Container(
      child: new Text(
        "xxx",
        style: new TextStyle(fontSize: 40, color: Colors.redAccent),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;

  MyHomePage({Key? key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    print("######## MyHomePage");
    return GestureDetector(
      onTap: _focusNode.requestFocus,

      child: Scaffold(
        appBar: AppBar(),
        body: new Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Focus(
                child: TextField(
                  controller: _controller,

                ),
                onFocusChange: (hasFocus) {
                  final String quantity =
                      _controller.value.text;
                  print(quantity);
                },
              ),
              const SizedBox(height: 20,),
              FloatingActionButton(onPressed: (){
                print(_controller.text);
              })
            ],
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     print("######### MyHomePage ${MediaQuery.of(context).viewInsets.bottom}");
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: InkWell(
//           onTap: () {
//             Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
//               return EditPage();
//             }));
//           },
//           child: new Text(
//             "Click",
//             style: TextStyle(fontSize: 16),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class EditPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: new Text("ControllerDemoPage"),
//       ),
//       extendBody: true,
//       body: Column(
//         children: [
//           new Spacer(),
//           new Container(
//             margin: EdgeInsets.all(10),
//             child: new Center(
//               child: new TextField(),
//             ),
//           ),
//           new Spacer(),
//           FloatingActionButton(onPressed: (){
//
//           }),
//         ],
//       ),
//     );
//   }
// }
