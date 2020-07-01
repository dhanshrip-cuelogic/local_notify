import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String payload;

  const SecondScreen({
    @required this.payload,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Testing'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              payload,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}
