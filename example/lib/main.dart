import 'package:flutter/material.dart';
import 'package:open_dropdown/open_dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Dropdown Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Open Dropdown Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///
  /// 1. Declare & Initiate a [GlobalKey]
  ///
  GlobalKey _dropdownKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton(

                  /// 2. Pass the [GlobalKey] in the dropdown widget
                  key: _dropdownKey,
                  hint: Text("This is a dropdown"),
                  isExpanded: true,

                  /// [REQUIRED onChanged]
                  onChanged: (_) {},
                  items: [
                    for (int i = 0; i < 5; i++)
                      DropdownMenuItem(
                        child: Text("Option ${i + 1}"),
                        value: i,
                      )
                  ]),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///
          /// [openDropdown on Tap]
          /// 3. Call openDropdown with the same [GlobalKey]
          openDropdown(_dropdownKey);
        },
        child: Icon(Icons.touch_app),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


