import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/emergency_info.dart';

class EmergencyViewModel extends ChangeNotifier {
  List<EmergencyInfo> emergencyList = [];
  bool isLoading = true;

  EmergencyViewModel() {
    fetchEmergencyInfo();
  }

  Future<void> fetchEmergencyInfo() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('emergencyContacts')
          .get();
      emergencyList = snapshot.docs
          .map((doc) =>
              EmergencyInfo.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Handle error
    }

    isLoading = false;
    notifyListeners();
  }
}
