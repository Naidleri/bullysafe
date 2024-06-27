import 'package:cloud_firestore/cloud_firestore.dart';

class EmergencyInfo {
  final String title;
  final String address;
  final String phone;
  final String icon;

  EmergencyInfo({
    required this.title,
    required this.address,
    required this.phone,
    required this.icon,
  });

  factory EmergencyInfo.fromJson(Map<String, dynamic> json) {
    return EmergencyInfo(
      title: json['title'],
      address: json['address'],
      phone: json['phone'],
      icon: json['icon'],
    );
  }
}
