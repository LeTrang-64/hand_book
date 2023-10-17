import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late TabController tabCtrl;
  var _container = Container(
    height: 200,
    color: Colors.blue,
    margin: EdgeInsets.symmetric(vertical: 10),
  );

  @override
  void initState() {
    tabCtrl = TabController(
      length: 2,
      vsync: this,
    );
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        child: _test3(),
      ),
    ));
  }

  Widget _test1() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text('Flutter Demo'),
          ),
        ];
      },
      body: Column(
        children: <Widget>[
          _container,
          Container(
            height: 700,
            child: ListView.builder(
              itemCount: 60,
              itemBuilder: (BuildContext context, int index) {
                return Text('Item $index');
              },
            ),
          ),
          _container,
          _container,
        ],
      ),
    );
  }

  final List<String> tabs = <String>['Tab 1', 'Tab 2'];

  Widget _test2() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        // These are the slivers that show up in the "outer" scroll view.
        return <Widget>[

          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              title: innerBoxIsScrolled ? Text('Profile') : null,
              background: Column(
                children: [Text('Profile')],
              ),
            ),
            // bottom: ,
          ),
        ];
      },
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  height: 200,
                  color: Colors.yellow,
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 30,
                      itemBuilder: (_, index) => ListTile(
                            title: Text('Item $index'),
                          )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _test3() {
    return CustomScrollView(
      slivers: [
        SliverLayoutBuilder(
          builder: (BuildContext context, constraints) {
            final scrolled = constraints.scrollOffset > 0;
            return SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Text("App bar", style: TextStyle(color: scrolled ? Colors.blue : Colors.red),),
              pinned: true,
              floating: true,
            );
          },
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.yellow,
          ),
        ),SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.red,
          ),
        ),SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.green,
          ),

        ),
        SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.blue,
          ),
        ),SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.cyan,
          ),
        ),SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.yellow,
          ),
        ),SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
