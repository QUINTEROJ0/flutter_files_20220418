import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isCheckedWork = false;
  bool _isCheckedHome = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
      ),
      body: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('Work'),
              value: _isCheckedWork,
              onChanged: (value) {
                setState(() {
                  _isCheckedWork = value!;
                  if (_isCheckedWork && _isCheckedHome) {
                    _isCheckedHome = false;
                  }
                });
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('Home'),
              value: _isCheckedHome,
              onChanged: (value) {
                setState(() {
                  _isCheckedHome = value!;
                  if (_isCheckedHome && _isCheckedWork) {
                    _isCheckedWork = false;
                  }
                });
              },
            ),
          ),
          // Agrega más ListTiles aquí si necesitas
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyWidget(),
  ));
}
