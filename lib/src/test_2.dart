import 'package:flutter/material.dart';
import 'package:fluttertagger/fluttertagger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterTagger Demo',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.redAccent.withOpacity(.3),
        ),
        primarySwatch: Colors.red,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  double overlayHeight = 380;

  late final _controller = FlutterTaggerController(
    //Initial text value with tag is formatted internally
    //following the construction of FlutterTaggerController.
    //After this controller is constructed, if you
    //wish to update its text value with raw tag string,
    //call (_controller.formatTags) after that.
    text:
        "Hey @11a27531b866ce0016f9e582#brad#. It's time to #11a27531b866ce0016f9e582#Flutter#!",
  );
  late final _focusNode = FocusNode();

  void _focusListener() {
    if (!_focusNode.hasFocus) {
      _controller.dismissOverlay();
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_focusListener);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.removeListener(_focusListener);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var insets = MediaQuery.of(context).viewInsets;

    return GestureDetector(
      onTap: () {
        _controller.dismissOverlay();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text("The"),
        ),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Spacer(),
                TextButton(
                    onPressed: () {
                      _controller.addTag(
                        id: '1',
                        name: 'user.userName',
                      );
                    },
                    child: Text("tap")),
                FlutterTagger(
                  controller: _controller,
                  onSearch: (query, triggerCharacter) {
                    //perform search
                  },
                  //characters that can trigger a search and the styles
                  //to be applied to their tagged results in the TextField
                  triggerCharacterAndStyles: const {
                    '@': TextStyle(color: Colors.pinkAccent),
                    '#': TextStyle(color: Colors.blueAccent),
                  },
                  overlayHeight: 600,
                  overlay: Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                    child: Text('xxx'),
                  ),
                  tagTextFormatter: (id, tag, triggerCharacter) {
                    return "$triggerCharacter$id#$tag#";
                  },
                  builder: (context, textFieldKey) {
                    // return a TextField and pass it `textFieldKey`
                    return TextField(
                      key: textFieldKey,
                      controller: _controller,
                      onChanged: (value) {},
                    );
                  },
                ),
                // SizedBox(height: insets.bottom,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
