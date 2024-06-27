import 'package:cloud_firestore/cloud_firestore.dart';

class Konselor {
  final String id;
  final String name;
  final String title;
  final String imageUrl;

  Konselor({
    required this.id,
    required this.name,
    required this.title,
    required this.imageUrl,
  });
}
