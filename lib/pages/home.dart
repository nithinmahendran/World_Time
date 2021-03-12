import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map home_data = {};

  @override
  Widget build(BuildContext context) {
    home_data = ModalRoute.of(context).settings.arguments;
    print(home_data);

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
        child: Column(
          children: [
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location')),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  home_data['location'],
                  style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              home_data['time'],
              style: TextStyle(fontSize: 66.0),
            )
          ],
        ),
      ),
    ));
  }
}
