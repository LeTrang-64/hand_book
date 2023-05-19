>In the video, Filip discusses the differences between creating widgets in Flutter using classes versus functions, and explains why the Flutter team recommends using classes. When creating a widget using a function, the function returns a widget that is built using other widgets. For example, a function might return a Container widget that contains a Button widget. This is called the helper widget method. On the other hand, when creating a widget using a class, the class extends a widget class and overrides its build() method. The build() method returns the widget that the class represents. For example, a class might extend the StatelessWidget class and return a Container widget with a Button widget inside.

> using classes because they offer several benefits
> 
- Classes can be more efficient than functions
- In classes, its build method is rerun when set state is called. However, for functions, the set state method will require Flutter to rebuild the entire wrapping widget
- Flutter can optimize the tree by reusing common parts of the tree, which can lead to faster rendering times
- Classes are more debuggable than functions (the Flutter developer tools can display the widget tree as a hierarchy of classes)
- Classes have a better default behavior. The only benefit of methods is having to write a tiny bit less code. There’s no functional benefit.