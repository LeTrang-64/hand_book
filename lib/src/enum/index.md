## What is an enum?

- Enum, short for enumerated type, is a data type that consists of a limited set of predefined
  values. In Dart, an enum is a special type of class that is used to represent a fixed number of
  constant values.
- Example:

```agsl
enum OperatingSystem { macOS, windows, linux }
```

### Enhanced enums

- Now resemble normal classes, allowing for the implementation of interfaces and mixins

```agsl
mixin Foo {
  bool get canBuildForIos;
}

enum OperatingSystem with Foo implements Comparable<OperatingSystem>{
  macOS(true, true),
  windows(false, true),
  linux(false, true);

  const OperatingSystem(this.canBuildForIos, this.canBuildForAndroid);
  
  final bool canBuildForAndroid;

  bool get isBestOperatingSystemForFlutterDevelopment => canBuildForIos && canBuildForAndroid;

  @override
  final bool canBuildForIos;

  @override
  int compareTo(OperatingSystem other) => name.length - other.name.length;
}
```

### Generics

- Enhanced enums also enable the use of generics for enums, as shown in the following example:

```agsl
enum OperatingSystem<T> {
  macOS<String>('Yes I can'),
  windows<int>(0),
  linux(false);

  const OperatingSystem(this.canBuildForIos);
  final T canBuildForIos;
}

print(OperatingSystem.values.map((e) => e.canBuildForIos));

//reuslts in
//(Yes I can, 0, false)
```

### Constraints

- We can declare final instance variables and getters
- Implement interfaces
- Other constraints that come with this feature are intuitive to understand when considering the
  nature of enums.

> Enums have an advantage in terms of readability and compile-time warnings, making them a
> preferable choice in these aspects