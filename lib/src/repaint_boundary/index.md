# cf_multi_picker

RepaintBoundary

## Usage

To use this plugin, add cf_multi_picker as a dependency in your pubspec.yaml file.

## Example
![repaint_boundar](resources/gif/repaint_boundary.gif)

> - In example 1, you can see that border colors are changing, which represents that the whole UI is rebuilding. But, one thing is more interesting in it, the StableWidget is still repainted every time even though it is not changing at all

> - Therefore we can conclude that it is building unnecessary parts each time, so the solution is we can tell the framework explicitly to not paint those widgets again which are not changing

## Use widget RepaintBoundary
```
void main() {
  debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}
```
## Preview

![repaint_boundar](resources/gif/repaint_boundary_2.gif)


