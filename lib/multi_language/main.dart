import 'package:flutter/material.dart';
import 'package:flutter_handbook/src/video_playback/pip_example_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'i18n/strings.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // add this
  LocaleSettings.useDeviceLocale(); // and this
  print(LocaleSettings.currentLocale);
  runApp(TranslationProvider(child: MyApp()));
}

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
    return MaterialApp(
        locale: LocaleSettings.currentLocale.flutterLocale, // use provider
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    LocaleSettings.getLocaleStream().listen((event) {
      print('locale changed: $event');
    });
  }

  @override
  Widget build(BuildContext context) {
    // get t variable, will trigger rebuild on locale change
    // otherwise just call t directly (if locale is not changeable)
    final t = Translations.of(context);
    final test1 = t.mainScreen.counter2.me(n: 1, name: 'trang');
    return Scaffold(
      appBar: AppBar(
        title: Text(t.mainScreen.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(t.mainScreen.counter(n: _counter)),
            Text(test1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              // lets loop over all supported locales
              children: AppLocale.values.map((locale) {
                // active locale
                AppLocale activeLocale = LocaleSettings.currentLocale;

                // typed version is preferred to avoid typos
                bool active = activeLocale == locale;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: active ? Colors.blue.shade100 : null,
                    ),
                    onPressed: () {
                      // locale change, will trigger a rebuild (no setState needed)
                      LocaleSettings.setLocale(locale);
                    },
                    child: Text(t.locales[locale.languageTag]!),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _counter++);
        },
        tooltip: t.mainScreen.tapMe, // using extension method
        child: Icon(Icons.add),
      ),
    );
  }
}
