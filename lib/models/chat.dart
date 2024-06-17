import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String message;
  final bool isUser;

  Chat(this.message, this.isUser);
}
