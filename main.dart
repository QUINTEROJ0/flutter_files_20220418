import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListTileExample(),
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListTileExample extends StatefulWidget {
  const ListTileExample({Key? key}) : super(key: key);

  @override
  _ListTileExampleState createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExample> {
  bool _isCheckedWork = false;
  bool _isCheckedHome = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse'),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.cloud_queue),
                  title: Text('Cloud Drives'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.system_security_update_good_outlined),
                  title: Text('On My iPhone'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.add_to_drive),
                  title: Text('Drive'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.wb_cloudy_sharp),
                  title: Text('pCloud'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.delete_rounded),
                  title: Text('Recently Deleted'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.arrow_circle_down),
                  title: Text('Downloads'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Tags',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
            ],
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SearchTextFieldExample(),
          ),
        ],
      ),
    );
  }
}

class SearchTextFieldExample extends StatefulWidget {
  const SearchTextFieldExample({Key? key}) : super(key: key);

  @override
  _SearchTextFieldExampleState createState() =>
      _SearchTextFieldExampleState();
}

class _SearchTextFieldExampleState extends State<SearchTextFieldExample> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: 'Buscador');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      color: Colors.grey[200],
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            // ignore: prefer_const_constructors
            borderSide: BorderSide(
              width: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoTabBarApp extends StatelessWidget {
  const CupertinoTabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoTabBarExample(),
    );
  }
}

class CupertinoTabBarExample extends StatelessWidget {
  const CupertinoTabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_fill),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock_solid),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
            label: 'Keypad',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(
              child: Text('Content of tab $index'),
            );
          },
        );
      },
    );
  }
}
