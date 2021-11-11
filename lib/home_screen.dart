import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blog_app/post_details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<QuerySnapshot>? subscription;

  List<DocumentSnapshot>? snapshot;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Post');

  @override
  void initState() {
    super.initState();

    subscription = collectionReference.snapshots().listen((dataSnapshot) {
      setState(() {
        snapshot = dataSnapshot.docs;
      });
    });
  }

  passData(DocumentSnapshot snap) {
    Future(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostDetailsPage(snapshot: snap),
        ),
      );
    });
  }

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
                title: const Text('Close'),
                leading: const Icon(
                  Icons.close,
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: snapshot!.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8,
            margin: const EdgeInsets.all(10),
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(10),
              // height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Text(
                      snapshot![index].get('title')[0],
                    ),
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 210,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: passData(snapshot!.first),
                          child: Text(
                            snapshot![index].get('title'),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot![index].get('content'),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
