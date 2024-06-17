import 'package:cloud_firestore/cloud_firestore.dart';

class Forum {
  String username;
  final String id;
  final String content;
  final Timestamp timestamp;

  Forum({
    required this.username,
    required this.id,
    required this.content,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'content': content,
      'timestamp': timestamp,
    };
  }

  factory Forum.fromMap(Map<String, dynamic> map) {
    return Forum(
      username: map['username'],
      id: map['id'],
      content: map['content'],
      timestamp: map['timestamp'],
    );
  }
}
