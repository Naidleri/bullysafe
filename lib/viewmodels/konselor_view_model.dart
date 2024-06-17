import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_bullysafe/models/konselor.dart';

class KonselorViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Konselor> _konselors = [];

  List<Konselor> get konselors => _konselors;

  Future<void> fetchKonselors() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('konselors').get();
      _konselors = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Konselor(
          id: doc.id,
          name: data['name'] ?? '',
          title: data['title'] ?? '',
          imageUrl: data['imageUrl'] ?? '',
        );
      }).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching konselors: $e');
    }
  }
}
