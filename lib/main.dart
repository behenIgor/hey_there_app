import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(HeyThereApp());

class HeyThereApp extends StatefulWidget {
  @override
  _HeyThereAppState createState() => _HeyThereAppState();
}

class _HeyThereAppState extends State<HeyThereApp> {
  bool _stateBut = true;
  Color _color = Colors.white;
  Color _colorBut = Colors.blue;
  Color _colorAppBar = Colors.blue;
  IconData _iconBut = Icons.not_interested;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Background Color Changer'),
          backgroundColor: _colorAppBar,
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _randomColorGenerator();
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: _color,
              ),
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: Text(
                  '  Hey \n there!',
                  style: new TextStyle(
                    fontSize: 125.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(_iconBut),
          backgroundColor: _colorBut,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.all(Radius.circular(16.0)
              )),
          onPressed: () {
            setState(() {
              _buttonStateSelection();
            });
          },
        ),
      ),
    );
  }

  _buttonStateSelection() {
    if (_stateBut) {
      _defaultWhiteColor();
      _changeButtonIconAndColor();
      _colorAppBar = Colors.blue;
      _stateBut = false;
    } else {
      _randomColorGenerator();
      _stateBut = true;
    }
  }

  _changeButtonIconAndColor() {
    _iconBut = Icons.adjust;
    _colorBut = Colors.red;
  }

  _randomColorGenerator() {
    final random = Random();
    _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1
    );
    _randomAppButtonColorGenerator();
    _iconBut = Icons.not_interested;
    _colorBut = Colors.blue;
    _stateBut = true;
  }

  _randomAppButtonColorGenerator() {
    final random = Random();
    _colorAppBar = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1
    );
  }

  _defaultWhiteColor() {
    _color = Color.fromRGBO(255, 255, 255, 1);
  }
}
