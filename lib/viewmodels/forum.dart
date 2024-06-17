import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_bullysafe/models/forum.dart';

class AddForumViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference forumCollection =
      FirebaseFirestore.instance.collection('forum');

  Future<void> addForum(Forum forum) async {
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user!.uid).get();

      if (userDoc.exists) {
        String username = userDoc['name'] ?? 'User';
        forum.username = username;
        await forumCollection.add({
          'username': forum.username,
          'content': forum.content,
          'timestamp': FieldValue.serverTimestamp(),
        });
      }
    }
  }
}
