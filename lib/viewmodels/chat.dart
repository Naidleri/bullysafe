import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_bullysafe/models/chat.dart';

class ChatViewModel {
  final CollectionReference _chatsCollection =
      FirebaseFirestore.instance.collection('chats');

  Stream<List<Chat>> getChats() {
    return _chatsCollection.snapshots().map((querySnapshot) {
      List<Chat> chats = [];
      querySnapshot.docs.forEach((doc) {
        chats.add(Chat(doc['message'], doc['isUser']));
      });
      return chats;
    });
  }

  Future<void> sendMessage(String message) async {
    await _chatsCollection.add({
      'message': message,
      'isUser': true,
    });
  }
}
