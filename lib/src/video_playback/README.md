# What is Picture-in-Picture Mode ?
Picture-in-Picture (PiP) functionality enriches the user experience by allowing video content to be displayed in a resizable and movable window while concurrently using other applications. Implementing PiP in Flutter applications provides users with added flexibility and convenience during video playback or any other functionality.


Step 1: Add these packages in your pubspec.yaml
* floating | Flutter Package
Picture in Picture mode management for Flutter. Available only for Android.
pub.dev

* video_player | Flutter Package
Flutter plugin for displaying inline video with other Flutter widgets on Android, iOS, and web.

Step 2: Add android:supportsPictureInPicture="true" line to the <activity> tag in android/src/main/AndroidManifest.xml:

Step 3: Create a straightforward video player widget with a seek Bar to enable video playback.

Step 4:

The “Floating” package offers a convenient “PiPSwitcher” widget designed for effortlessly toggling between displayed widgets based on the current Picture-in-Picture (PiP) status. Utilize it in the following manner:

