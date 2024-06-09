import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/models/laporan.dart';

class LaporViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  User? user = FirebaseAuth.instance.currentUser;

  Future<String?> uploadFile(File file) async {
    try {
      String filePath =
          'laporan/${DateTime.now().millisecondsSinceEpoch}_${file.uri.pathSegments.last}';
      Reference storageRef = _storage.ref().child(filePath);
      UploadTask uploadTask = storageRef.putFile(file);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  Future<void> addLaporan(Laporan laporan, File? file) async {
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user!.uid).get();

      if (userDoc.exists) {
        String username = userDoc['name'] ?? 'User';
        laporan.username = username;

        if (file != null) {
          String? filePath = await uploadFile(file);
          laporan.filePath = filePath;
        }

        await _firestore.collection('laporan').add({
          'username': laporan.username,
          'namaPelapor': laporan.namaPelapor,
          'hubungan': laporan.hubungan,
          'namaKorban': laporan.namaKorban,
          'educationLevel': laporan.educationLevel,
          'jenisKelaminKorban': laporan.jenisKelaminKorban,
          'jenisKekerasan': laporan.jenisKekerasan,
          'deskripsiKejadian': laporan.deskripsiKejadian,
          'filePath': laporan.filePath,
          'lokasiKejadian': laporan.lokasiKejadian,
          'timestamp': FieldValue.serverTimestamp(),
        });

        notifyListeners();
      } else {
        throw Exception('User document not found');
      }
    }
  }
}
