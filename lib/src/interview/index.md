
1. Types of Build Modes in Flutter
* Debug Mode

This is the default mode when you run your app from the command line or an IDE. In debug mode, your app is compiled with additional code that enables features like hot reloading and debugging. This mode is useful for development and testing, as it provides quick feedback and allows you to debug your app more easily.

* Assertions are enabled.

* Service extensions are enabled.

* The compilation is optimized for fast development and run cycles (but not for execution speed, binary size, or deployment).

* Debugging is enabled, and tools supporting source-level debugging (such as DevTools) can connect to the process.

* Release mode

This is the mode in which you package and distribute your app to users. In release mode, your app is optimized for performance and size, and unnecessary code and debug information are removed. This mode is slower to build and deploy than debug mode but produces a more efficient and streamlined app.

* Assertions are disabled.

* Debugging information is stripped out.

* Debugging is disabled.

* The compilation is optimized for fast startup, fast execution, and small package sizes.

* Service extensions are disabled.

* Profile Mode

This mode is similar to the release mode, but with additional performance profiling information. When your app is compiled in profile mode, it generates profiling data that can be used to identify performance bottlenecks and optimize your app’s performance. This mode is useful for profiling and optimizing your app, but is slower than release mode.

2. Life Cycle of Stateful widget
* createState

* mounted = true

* initState

* didChangeDependencies

* build

* didUpdateWidget

* setState

* deactivate

* dispose

* mounted = false.

3. What are futures in Dart?
   Ans: Futures are a way to represent a value that is not available yet but will be available at some point in the future. A Future represents the result of an asynchronous operation. Eg: Reading data from a file, making an HTTP request, etc.

4. What are streams in Dart?
   Ans: Streams are a way to process asynchronous data. Streams allow us to process data as it arrives rather than waiting for all data to arrive before starting to process it. Stream is a sequence of asynchronous events that are produced by the source and can be listened to by the subscribers.

5. What is Scaffold?
   Ans: Scaffold is a widget that provides a basic structure for building an app screen. Scaffolds are classes in Flutter that expose API which can be used to create the basic Material Design layouts. It supports Appbar, drawer, bottom nav bar, bottom sheet etc.

6. What are mixins?
   Ans: Mixins are a way of reusing a class’s code in multiple class hierarchies. They provide an easy way to reuse code from different classes that don’t quite fit into the same class hierarchy. A mixin is a class that can be used as a sort of plug-in to add functionality to other classes without requiring inheritance. With mixins, you can add functionality to a class without having to create a new class or modify the original class’s code. To include a mixin we use the `with` keyword.

mixin LogMixin {
void log(String message) {
print('LOG: $message');
}
}
class MyClass with LogMixin {
void doSomething() {
log('Doing something');
// Other code here
}
}
7. What is tree shaking in Flutter?
   Ans. Tree shaking in flutter is the process of elimination of dead code in Flutter. It eliminates parts of code that are unused from the final application binary. Tree shaking is mainly done as an optimization to reduce the size of the application binary.

8. What is BuildContext in Flutter?
   Ans. BuildContext is a locator which is used to locate a widget in the widget tree. It provides information about the widget i.e. its position, size, etc. The BuildContext of each widget is passed to their build method. It is unique to each widget. you can use it to retrieve the nearest ancestor widget of a certain type using the `ancestorWidgetOfExactType`

9. What are keys in Flutter?
   Ans. Keys are identifiers for widgets, elements and semantic nodes. In flutter, the Key is an Object used to uniquely identify a widget in the widget tree. Keys are found as optional named parameters in almost all widgets in Flutter. Keys are used for identifying and tracking widgets in the widget tree. By using keys we can ensure that the widgets are updated correctly.

10. What is an event loop in Flutter?
    Ans. An event loop’s job is to take an item from the event queue and handle it, repeating these two steps for as long as the queue has items. The items in the queue might represent user input, file I/O notifications, timers, and more. A Dart app has a single event loop with *two* queues — the *event queue* and the *microtask queue*. Order of execution: code in the main function, code in the microtask queue, and task in the event queue.

11. Difference between Plugin and Package in Flutter.
    Ans. The package contains only Dart code. A plugin contains both Dart and Native code.

12. What is the difference between Expanded and Flexible?
    Ans. Expanded is an extended class of Flexible. If the child of the flexible widget knows its height (in Column and width in Row) then it will take the mentioned height. But the Expanded widget does not care about the size of the child at all and will take up the available space.

13. What are the types of trees in Flutter?
    Ans. There are 3 types of trees in Flutter. Widget tree, Element Tree and Render Object Tree.

Widget Tree: A Widget tree is a tree that will be created based on how you design your screen and how you are adding widgets to your screen.

* Element Tree: For each widget that you create in Widget Tree, the Flutter framework will create an element into Element Tree using the **createElement()** method. Each element will depict whether a widget is stateless or stateful. It also uses keys for effective rebuilds.

* Render Object tree: It is the tree that is visible on the screen. Flutter framework renders or draws your UI, it looks at the Render Object Tree instead of the Widget or Element Tree because Render Tree is the one that controls all the properties of the widget
  Checkout Part 2 of this Series here

