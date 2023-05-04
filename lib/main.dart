import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Chinese Input Bug Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TextField Chinese Input Bug Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ///
            const Text("Only TextField() Normal"),
            const SizedBox(
              height: 100,
              width: 200,
              child: TextField(),
            ),

            ///
            const Text("maxLines = null, Not Normal"),
            const SizedBox(
              height: 200,
              width: 200,
              child: TextField(
                maxLines: null,
                // minLines: 1,
              ),
            ),

            ///
            const Text("With maxLines != null, minLines != null, Not Normal"),
            const SizedBox(
              height: 200,
              width: 200,
              child: TextField(
                // maxLength: 100000,
                maxLines: 300,
                minLines: 1,
              ),
            ),

            const Text(
                "With InputFormatter ,Only allow chinese and numbers.  Not Normal"),
            SizedBox(
              height: 100,
              width: 200,
              child: TextField(

                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]")),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
