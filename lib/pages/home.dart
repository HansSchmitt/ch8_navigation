import 'package:flutter/material.dart';
import 'package:ch8_navigation/pages/about.dart';
import 'package:ch8_navigation/pages/gratitude.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _howAreYou = '...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => _openPageAbout(context: context, fullScreenDialog: true,),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Grateful for: $_howAreYou', style: TextStyle(fontSize: 32.0),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        tooltip: 'About',
        child: Icon(Icons.sentiment_satisfied),
      ),
    );
  }

  void _openPageAbout({BuildContext context, bool fullScreenDialog = false}){
    Navigator.push(context,
    MaterialPageRoute(
      fullscreenDialog: fullScreenDialog,
      builder: (context) => About(),
    ),
    );
  }

  void _openPageGratitude({BuildContext context}) async{
    final String _gratitudeResponse = await Navigator.push(
    context,
    MaterialPageRoute(
      fullscreenDialog: false,
      builder: (context) => Gratitude(
        radioGroupValue: -1,
      ),
    ),
    );
    _howAreYou = _gratitudeResponse ?? '';
  }

}
