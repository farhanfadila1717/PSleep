import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isScreenAwake = false;

  void toggleScreenAwake() {
    setState(() {
      _isScreenAwake = !_isScreenAwake;
      WakelockPlus.toggle(enable: _isScreenAwake);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Screen Always Awake'),
            const SizedBox.square(dimension: 20),
            Switch.adaptive(
              value: _isScreenAwake,
              onChanged: (value) => toggleScreenAwake(),
            ),
          ],
        ),
      ),
    );
  }
}
