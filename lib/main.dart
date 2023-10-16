import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDemo(),
    );
  }
}

class GestureDemo extends StatefulWidget {
  @override
  _GestureDemoState createState() => _GestureDemoState();
}

class _GestureDemoState extends State<GestureDemo> {
  String _gestureMessage = "No gesture detected";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Detector Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _gestureMessage = "Tap gesture detected";

                   _showDialog(context,_gestureMessage);

                });
              },
              onDoubleTap: () {
                setState(() {
                  _gestureMessage = "Double tap gesture detected";
                   _showDialog(context,_gestureMessage);
                });
              },
              onLongPress: () {
                setState(() {
                  _gestureMessage = "Long press gesture detected";
                   _showDialog(context,_gestureMessage);
                });

              },
              
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: Text(
                  "CLICK ME HERE!!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _gestureMessage,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}





  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Gesture Detected'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
