import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Blog App',
        ),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            onPressed: () => debugPrint('search'),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => debugPrint('add'),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Mikhael'),
              accountEmail: Text('mikhael@gmail.com'),
              decoration: BoxDecoration(color: Colors.indigo),
            ),
            const ListTile(
              title: Text('First Page'),
              leading: Icon(Icons.person),
            ),
            const ListTile(
              title: Text('First Page'),
              leading: Icon(Icons.person),
            ),
            const ListTile(
              title: Text('First Page'),
              leading: Icon(Icons.person),
            ),
            const ListTile(
              title: Text('First Page'),
              leading: Icon(Icons.person),
            ),
            const Divider(
              height: 10,
              color: Colors.indigo,
            ),
            ListTile(
                title: Text('Close'),
                leading: const Icon(
                  Icons.close,
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
