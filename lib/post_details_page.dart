import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostDetailsPage extends StatefulWidget {
  final DocumentSnapshot snapshot;
  const PostDetailsPage({Key? key, required this.snapshot}) : super(key: key);

  @override
  _PostDetailsPageState createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: Colors.purple,
      ),
      body: Card(
        margin: const EdgeInsets.all(10.0),
        elevation: 12.0,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                      child: Text(
                    widget.snapshot['title'][0],
                    style: const TextStyle(fontSize: 20),
                  )),
                  const SizedBox(width: 20),
                  Text(
                    widget.snapshot.get('title'),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                widget.snapshot.get('content'),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
