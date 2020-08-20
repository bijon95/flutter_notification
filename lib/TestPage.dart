import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return Scaffold(

      appBar: AppBar(title: Text("Test Page"),),
      body: Container(child: Text("Test    Page"),),
    );
  }
}
